#!/bin/bash

OUTPUT="$(pwd)/images"
BUILD_VERSION="21.02.3"
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

make image  PROFILE="linksys_mr8300" \
           PACKAGES="kmod-rt2800-usb rt2800-usb-firmware kmod-cfg80211 kmod-lib80211 kmod-mac80211 kmod-rtl8192cu \
                     bash git git-http luci-base luci-ssl luci-mod-admin-full luci-theme-bootstrap \
                     kmod-usb-storage kmod-usb-ohci kmod-usb-uhci e2fsprogs fdisk resize2fs \
                     htop debootstrap luci-compat luci-lib-ipkg dnsmasq" \
            FILES="${BASEDIR}/files/" \
            BIN_DIR="${OUTPUT}"
