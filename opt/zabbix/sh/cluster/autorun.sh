#!/sbin/sh
/usr/sbin/cmviewcl -f line -p $1 | awk -F\= '/autorun/ {print $2}'
