#!/bin/bash

TCPDUMP="4.7.4"
LIBPCAP="1.7.4"


# This is an internal variable, do not change this value
BUILD="$HOME/build"


# Get sources

cd $BUILD

wget http://www.tcpdump.org/release/tcpdump-$TCPDUMP.tar.gz
wget http://www.tcpdump.org/release/libpcap-$LIBPCAP.tar.gz

tar zxvf tcpdump-$TCPDUMP.tar.gz
tar zxvf libpcap-$LIBPCAP.tar.gz

rm tcpdump-$TCPDUMP.tar.gz
rm libpcap-$LIBPCAP.tar.gz


# Build libpcat

export CC=arm-linux-gnueabi-gcc

cd libpcap-$LIBPCAP

./configure --host=arm-linux --with-pcap=linux
make


# Build tcpdump

cd $BUILD/tcpdump-$TCPDUMP

export ac_cv_linux_vers=4
export CFLAGS=-static
export CPPFLAGS=-static
export LDFLAGS=-static

./configure --host=arm-linux --disable-ipv6
make

arm-linux-gnueabi-strip tcpdump
