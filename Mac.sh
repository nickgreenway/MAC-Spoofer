#!/bin/bash

<<info
Simple script to reset your MAC & IP.
Tested on wireless interface in Mac OS X 10.12.6
info

# Your network interface here
IF=en0


MAC=`openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//'`

echo "Intial Status:"
sudo ifconfig $IF

disassociate="sudo /System/Library/PrivateFrameworks/Apple80211.framework/\
Versions/Current/Resources/airport -z"

eval $disassociate
sleep 2
sudo ifconfig $IF lladdr $MAC
sleep 2
sudo ifconfig $IF down
sleep 2
sudo ifconfig $IF up
sleep 2

echo "MAC changed. Retrieving new network status:"
sleep 10
ifconfig $IF