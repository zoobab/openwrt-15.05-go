#!/bin/bash

set -x

echo "=== Downloading and untarring... ==="
TARBALL="OpenWrt-Toolchain-ar71xx-generic_gcc-5.3.0_glibc-2.19.Linux-x86_64.tar.bz2"

wget -c http://filez.zoobab.com/openwrt/gccgo-toolchain/ar71xx-glibc/$TARBALL -O $TARBALL
tar -xf $TARBALL

echo "=== Cross Compiling hello.go ==="
ROOTDIR="$PWD/OpenWrt-Toolchain-ar71xx-generic_gcc-5.3.0_glibc-2.19.Linux-x86_64/toolchain-mips_34kc_gcc-5.3.0_glibc-2.19"
GCCGO="$ROOTDIR/bin/mips-openwrt-linux-gccgo -Wl,-R,$ROOTDIR/lib/gcc/mips-openwrt-linux-gnu/5.3.0 -L $ROOTDIR/lib"
$GCCGO -o hello hello.go -static-libgo
file hello
