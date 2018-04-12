#!/bin/sh

# Remove all kernel images except the newest one.

echo $(dpkg --list |
grep linux-image |
awk '{ print $2 }' |
sort -V |
sed -n '/'`uname -r`'/q;p') $(dpkg --list |
grep linux-headers |
awk '{ print $2 }' |
sort -V |
sed -n '/'"$(uname -r | sed "s/\([0-9.-]*\)-\([^0-9]\+\)/\1/")"'/q;p') |
xargs sudo apt-get -y purge