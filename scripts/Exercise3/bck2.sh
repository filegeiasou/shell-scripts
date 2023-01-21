#!/bin/bash

src=~/
dst=/tmp/

# create backup
tar -cf "$src.tar" "$src"

# copy backup to destination
cp "$src.tar" "$dst"

# schedule backup to run every sunday at 11pm for the next 6 months
(crontab -e ; echo "0 23 * * 0 tar -cf $src.tar $src; cp $src.tar $dst" ) 

