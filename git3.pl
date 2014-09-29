#!/usr/bin/perl

use strict;
use warnings;

my $cmd = `git status`;

if ( $cmd =~ /Untracked/ )
{
    print $cmd;
}
else
{
    `git commit -a -m "3 verses/day."`;
    `git push`;
}
