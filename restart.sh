#!/bin/bash

cat /etc/motd | awk 'BEGIN{flag=0}{
    if ( $0 ~ /\*\*\*/ )
    {
        flag=1;
    }
} END{if(flag==1){print "System restart required";}}'
