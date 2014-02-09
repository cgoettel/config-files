#!/bin/bash

NEEDSTASH=`git ls-files -m |wc -l`
GITROOT=$(git rev-parse --show-cdup)

if [ -n "$GITROOT" ] ; then
    cd $GITROOT
fi
git fetch
if [ "$NEEDSTASH" -gt "0" ] ; then
    echo "HERE"
    git stash save git_pull_rebase$(date +%Y%m%d%H%M)
fi
git pull --rebase --stat --ff-only
if [ "$NEEDSTASH" -gt "0" ] ; then
    echo "HERE"
    git stash pop
fi
