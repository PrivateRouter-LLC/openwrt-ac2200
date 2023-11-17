#!/bin/bash

OUTPUT="$(pwd)/images"
BUILD_VERSION="21.02.2"
BUILDER="https://downloads.openwrt.org/releases/${BUILD_VERSION}/targets/ipq40xx/generic/openwrt-imagebuilder-${BUILD_VERSION}-ipq40xx-generic.Linux-x86_64.tar.xz"

BASEDIR=$(realpath "$0" | xargs dirname)

# download image builder
if [ ! -f "${BUILDER##*/}" ]; then
	wget "$BUILDER"
	tar xJvf "${BUILDER##*/}"
fi

[ -d "${OUTPUT}" ] || mkdir "${OUTPUT}"

cd openwrt-*/

# clean previous images
make clean

make image  PROFILE="linksys_ea8300" \
           PACKAGES="block-mount kmod-fs-ext4 kmod-usb-storage blkid mount-utils swap-utils e2fsprogs fdisk luci dnsmasq bash git git-http jq" \
           FILES="${BASEDIR}/files/" \
            BIN_DIR="$OUTPUT"
