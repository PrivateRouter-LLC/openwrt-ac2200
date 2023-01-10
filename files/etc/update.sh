#!/bin/sh
# /etc/udpate.sh PrivateRouter Update Script

# Verify we are connected to the Internet
is_connected() {
    ping -q -c3 1.1.1.1 >/dev/null 2>&1
    return $?
}


[ is_connected ] && {

   echo "updating all packages!"

   echo "                                                                      "
   echo " ███████████             ███                         █████            "
   echo "░░███░░░░░███           ░░░                         ░░███             "
   echo " ░███    ░███ ████████  ████  █████ █████  ██████   ███████    ██████ "
   echo " ░██████████ ░░███░░███░░███ ░░███ ░░███  ░░░░░███ ░░░███░    ███░░███"
   echo " ░███░░░░░░   ░███ ░░░  ░███  ░███  ░███   ███████   ░███    ░███████ "
   echo " ░███         ░███      ░███  ░░███ ███   ███░░███   ░███ ███░███░░░  "
   echo " █████        █████     █████  ░░█████   ░░████████  ░░█████ ░░██████ "
   echo "░░░░░        ░░░░░     ░░░░░    ░░░░░     ░░░░░░░░    ░░░░░   ░░░░░░  "
   echo "                                                                      "
   echo "                                                                      "
   echo " ███████████                        █████                             "
   echo "░░███░░░░░███                      ░░███                              "
   echo " ░███    ░███   ██████  █████ ████ ███████    ██████  ████████        "
   echo " ░██████████   ███░░███░░███ ░███ ░░░███░    ███░░███░░███░░███       "
   echo " ░███░░░░░███ ░███ ░███ ░███ ░███   ░███    ░███████  ░███ ░░░        "
   echo " ░███    ░███ ░███ ░███ ░███ ░███   ░███ ███░███░░░   ░███            "
   echo " █████   █████░░██████  ░░████████  ░░█████ ░░██████  █████           "
   echo "░░░░░   ░░░░░  ░░░░░░    ░░░░░░░░    ░░░░░   ░░░░░░  ░░░░░            "

   opkg update
   #Go Go Packages
   opkg install wireguard-tools ath10k-board-qca4019 ath10k-board-qca9888 ath10k-board-qca988x ath10k-firmware-qca4019-ct ath10k-firmware-qca9888-ct ath10k-firmware-qca988x-ct attr avahi-dbus-daemon base-files block-mount busybox ca-bundle certtool cgi-io dbus dnsmasq dropbear e2fsprogs fdisk firewall fstools fwtool

   opkg install getrandom hostapd-common ip-full ip6tables ipq-wifi-linksys_mr8300-v0 ipset iptables iptables-mod-ipopt iw iwinfo jshn jsonfilter kernel kmod-ath kmod-ath10k-ct kmod-ath9k kmod-ath9k-common kmod-cfg80211 kmod-crypto-crc32c kmod-crypto-hash kmod-crypto-kpp kmod-crypto-lib-blake2s kmod-crypto-lib-chacha20 kmod-crypto-lib-chacha20poly1305 kmod-crypto-lib-curve25519 kmod-crypto-lib-poly1305 kmod-fs-exfat kmod-fs-ext4

   opkg install kmod-gpio-button-hotplug kmod-hwmon-core kmod-ip6tables kmod-ipt-conntrack kmod-ipt-core kmod-ipt-ipopt kmod-ipt-ipset kmod-ipt-nat kmod-ipt-offload kmod-leds-gpio kmod-lib-crc-ccitt kmod-lib-crc16 kmod-mac80211 kmod-mii kmod-nf-conntrack

   opkg install kmod-nf-conntrack6 kmod-nf-flow kmod-nf-ipt kmod-nf-ipt6 kmod-nf-nat kmod-nf-reject kmod-nf-reject6 kmod-nfnetlink kmod-nls-base kmod-ppp kmod-pppoe kmod-pppox kmod-scsi-core kmod-slhc kmod-tun

   opkg install kmod-udptunnel4 kmod-udptunnel6 kmod-usb-core kmod-usb-dwc3 kmod-usb-dwc3-qcom kmod-usb-ehci kmod-usb-ledtrig-usbport kmod-usb-net kmod-usb-net-cdc-eem kmod-usb-net-cdc-ether kmod-usb-net-cdc-ncm kmod-usb-net-cdc-subset kmod-usb-net-ipheth kmod-usb-storage kmod-usb2

   opkg install kmod-usb3 kmod-wireguard libatomic1 libattr libavahi-client ath10k-board-qca4019 ath10k-board-qca9888 ath10k-board-qca988x ath10k-firmware-qca4019-ct ath10k-firmware-qca9888-ct ath10k-firmware-qca988x-ct attr avahi-dbus-daemon base-files block-mount busybox ca-bundle

   opkg install certtool cgi-io dbus dnsmasq dropbear e2fsprogs fdisk firewall fstools fwtool getrandom hostapd-common ip-full ip6tables ipq-wifi-linksys_mr8300-v0 ipset iptables iptables-mod-ipopt iw iwinfo jshn jsonfilter kernel kmod-ath kmod-ath10k-ct kmod-ath9k kmod-ath9k-common

   opkg install kmod-cfg80211 kmod-crypto-crc32c kmod-crypto-hash kmod-crypto-kpp kmod-crypto-lib-blake2s kmod-crypto-lib-chacha20 kmod-crypto-lib-chacha20poly1305 kmod-crypto-lib-curve25519 kmod-crypto-lib-poly1305 kmod-fs-exfat kmod-fs-ext4 kmod-gpio-button-hotplug kmod-hwmon-core

   opkg install kmod-ip6tables kmod-ipt-conntrack kmod-ipt-core kmod-ipt-ipopt kmod-ipt-ipset kmod-ipt-nat kmod-ipt-offload kmod-leds-gpio kmod-lib-crc-ccitt kmod-lib-crc16 kmod-mac80211 kmod-mii kmod-nf-conntrack kmod-nf-conntrack6 kmod-nf-flow kmod-nf-ipt kmod-nf-ipt6 kmod-nf-nat kmod-nf-reject

   opkg install kmod-nf-reject6 kmod-nfnetlink kmod-nls-base kmod-ppp kmod-pppoe kmod-pppox kmod-scsi-core kmod-slhc kmod-tun kmod-udptunnel4 kmod-udptunnel6 kmod-usb-core kmod-usb-dwc3 kmod-usb-dwc3-qcom kmod-usb-ehci kmod-usb-ledtrig-usbport kmod-usb-net kmod-usb-net-cdc-eem kmod-usb-net-cdc-ether

   opkg install kmod-usb-net-cdc-ncm kmod-usb-net-cdc-subset kmod-usb-net-ipheth kmod-usb-storage kmod-usb2 kmod-usb3 kmod-wireguard libatomic1 libattr libavahi-client minidlna mtd netifd odhcp6c odhcpd-ipv6only openconnect openssh-sftp-client

   opkg install openvpn-openssl openwrt-keyring opkg ppp ppp-mod-pppoe procd resolveip rpcd rpcd-mod-file rpcd-mod-iwinfo rpcd-mod-luci rpcd-mod-rrdns samba4-libs samba4-server socksify swconfig terminfo ubi-utils uboot-envtools ubox ubus ubusd uci uclient-fetch uhttpd uhttpd-mod-ubus

   opkg install urandom-seed urngd usbids usbmuxd usbutils usign vpn-policy-routing vpnbypass vpnc-scripts watchcat wireguard-tools wireless-regdb wpad-basic-wolfssl

   opkg install zlib kmod-usb-storage block-mount luci-app-minidlna kmod-fs-ext4 kmod-fs-exfat fdisk luci-compat luci-lib-ipkg luci-proto-wireguard luci-app-wireguard luci-i18n-wireguard-en vpn-policy-routing vpnbypass vpnc-scripts watchcat wg-installer-client

   opkg install wireguard-tools luci-app-openvpn luci-app-vpn-policy-routing luci-app-vpnbypass luci-app-watchcat luci-app-wireguard
   echo "Installing TorGuard Wireguard..."
   opkg install /etc/luci-app-tgwireguard_1.0.1-1_all.ipk

   echo "PrivateRouter update complete!"

   exit 0
} || exit 1
