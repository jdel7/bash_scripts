#!/bin/bash
#
# This script takes a snapshot of the running processes, removes the first line of the file
# and then removes everything else other than the processes names.
# 
# Created by Alexander Delgado
# April 4th, 2018
#

FILE=$(date +%F)_$(date +%a)_$(date +%T)

ps -A > /var/log/prcs-snps/$FILE

# Removes the first line of $FILE
tail -n +2 "/var/log/prcs-snps/$FILE" > "/var/log/prcs-snps/$FILE.tmp" && mv "/var/log/prcs-snps/$FILE.tmp" "/var/log/prcs-snps/$FILE"

# Removes everything but the last word of $FILE using awk
awk 'NF>1{print $NF}' "/var/log/prcs-snps/$FILE" > "/var/log/prcs-snps/$FILE.tmp" && mv "/var/log/prcs-snps/$FILE.tmp" "/var/log/prcs-snps/$FILE"

echo "The file created is called $FILE"

