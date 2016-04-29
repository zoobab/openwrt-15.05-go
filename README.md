A GCCGO toolchain for OpenWRT
=============================

A Docker build image for GCCGO cross toolchain for OpenWRT 15.05.

Target is a MIPS24K Gl.inet router.

Binaries
========

You can find the binaries of the compilation here:

http://filez.zoobab.com/openwrt/gccgo-toolchain/ar71xx-glibc/

The toolchain contains `mips-openwrt-linux-gnu-gccgo`, `mips-openwrt-linux-gnu-go`, `mips-openwrt-linux-gnu-gofmt` and the go libraries:

http://filez.zoobab.com/openwrt/gccgo-toolchain/ar71xx-glibc/OpenWrt-Toolchain-ar71xx-generic_gcc-5.3.0_glibc-2.19.Linux-x86_64.tar.bz2

Usage
=====

You can build the complete OpenWRT with the Docker recipe like this:

```
$ docker build -t openwrt-15.05-go:latest .
```

The output is roughly 10GB.

And then run inside to find the toolchain:

```
$ docker run -i -t openwrt-15.05-go:latest /bin/bash
```

You will find the toolchain under `/home/openwrt/openwrt-15.05/staging_dir/toolchain-mips_34kc_gcc-5.3.0_glibc-2.19/bin` .

Compile a hello.go
==================

Look at build.sh on how to build a hello.go with the toolchain.

Links
=====

* Cross-compile an hello.go: http://www.sajalkayan.com/post/golang-openwrt-mips.html
