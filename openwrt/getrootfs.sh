#!/bin/sh

set -e

if [ -f rootfs.tar ]; then
	rm rootfs.tar
fi

curl -o rootfs.tar.gz http://downloads.openwrt.org/latest/x86/generic/openwrt-x86-generic-Generic-rootfs.tar.gz
gunzip rootfs.tar.gz
