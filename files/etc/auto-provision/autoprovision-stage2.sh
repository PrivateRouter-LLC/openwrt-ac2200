#!/bin/bash

# autoprovision stage 2: this script will be executed upon boot if the extroot was successfully mounted (i.e. rc.local is run from the extroot overlay)

. /etc/auto-provision/autoprovision-functions.sh

installPackages()
{
    signalAutoprovisionWaitingForUser

    until (opkg update)
      do
        log "opkg update failed. No internet connection? Retrying in 15 seconds..."
        sleep 15
    done

    signalAutoprovisionWorking

    log "Autoprovisioning stage2 is about to install packages"

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

    # Fix https to http for mini routers
    sed -i 's,https,http,g' /etc/opkg/distfeeds.conf;
    # Update the package list
      opkg update
    ## INSTALL MESH  ##
    log_say "Installing Mesh Packages..."
    opkg install tgrouterappstore luci-app-shortcutmenu luci-app-poweroff luci-app-wizard
    opkg remove wpad wpad-basic wpad-basic-openssl wpad-basic-wolfssl wpad-wolfssl wpad-mbedtls wpad-basic-mbedtls
    opkg install wpad-mesh-openssl kmod-batman-adv batctl avahi-autoipd batctl-full luci-app-dawn libiwinfo-lua
    opkg install wpad-mesh-openssl
    opkg install luci-app-easymesh
    opkg install luci-proto-batman-adv
    
    #Go Go Packages
    opkg install wireguard-tools ath10k-board-qca4019 ath10k-board-qca9888 ath10k-board-qca988x ath10k-firmware-qca4019-ct ath10k-firmware-qca9888-ct ath10k-firmware-qca988x-ct attr avahi-dbus-daemon base-files block-mount busybox ca-bundle certtool cgi-io dbus dnsmasq dropbear e2fsprogs fdisk firewall fstools fwtool

    opkg install getrandom hostapd-common ip-full ip6tables ipq-wifi-linksys_mr8300-v0 ipset iptables iptables-mod-ipopt iw iwinfo jshn jsonfilter kernel kmod-ath kmod-ath10k-ct kmod-ath9k kmod-ath9k-common kmod-cfg80211 kmod-crypto-crc32c kmod-crypto-hash kmod-crypto-kpp kmod-crypto-lib-blake2s kmod-crypto-lib-chacha20 kmod-crypto-lib-chacha20poly1305 kmod-crypto-lib-curve25519 kmod-crypto-lib-poly1305 kmod-fs-exfat kmod-fs-ext4

    opkg install kmod-gpio-button-hotplug kmod-hwmon-core kmod-ip6tables kmod-ipt-conntrack kmod-ipt-core kmod-ipt-ipopt kmod-ipt-ipset kmod-ipt-nat kmod-ipt-offload kmod-leds-gpio kmod-lib-crc-ccitt kmod-lib-crc16 kmod-mac80211 kmod-mii kmod-nf-conntrack

    opkg install kmod-nf-conntrack6 kmod-nf-flow kmod-nf-ipt kmod-nf-ipt6 kmod-nf-nat kmod-nf-reject kmod-nf-reject6 kmod-nfnetlink kmod-nls-base kmod-ppp kmod-pppoe kmod-pppox kmod-scsi-core kmod-slhc kmod-tun

    opkg install kmod-udptunnel4 kmod-udptunnel6 kmod-usb-core kmod-usb-dwc3 kmod-usb-dwc3-qcom kmod-usb-ehci kmod-usb-ledtrig-usbport kmod-usb-net kmod-usb-net-cdc-eem kmod-usb-net-cdc-ether kmod-usb-net-cdc-ncm kmod-usb-net-cdc-subset kmod-usb-net-ipheth kmod-usb-storage kmod-usb2

    opkg install kmod-usb3 kmod-wireguard libatomic1 libattr libavahi-client ath10k-board-qca4019 ath10k-board-qca9888 ath10k-board-qca988x ath10k-firmware-qca4019-ct ath10k-firmware-qca9888-ct ath10k-firmware-qca988x-ct attr avahi-dbus-daemon base-files block-mount busybox ca-bundle

    opkg install certtool cgi-io dbus dnsmasq-full dropbear e2fsprogs fdisk firewall fstools fwtool getrandom hostapd-common ip-full ip6tables ipq-wifi-linksys_mr8300-v0 ipset iptables iptables-mod-ipopt iw iwinfo jshn jsonfilter kernel kmod-ath kmod-ath10k-ct kmod-ath9k kmod-ath9k-common

    opkg install kmod-cfg80211 kmod-crypto-crc32c kmod-crypto-hash kmod-crypto-kpp kmod-crypto-lib-blake2s kmod-crypto-lib-chacha20 kmod-crypto-lib-chacha20poly1305 kmod-crypto-lib-curve25519 kmod-crypto-lib-poly1305 kmod-fs-exfat kmod-fs-ext4 kmod-gpio-button-hotplug kmod-hwmon-core

    opkg install kmod-ip6tables kmod-ipt-conntrack kmod-ipt-core kmod-ipt-ipopt kmod-ipt-ipset kmod-ipt-nat kmod-ipt-offload kmod-leds-gpio kmod-lib-crc-ccitt kmod-lib-crc16 kmod-mac80211 kmod-mii kmod-nf-conntrack kmod-nf-conntrack6 kmod-nf-flow kmod-nf-ipt kmod-nf-ipt6 kmod-nf-nat kmod-nf-reject

    opkg install kmod-nf-reject6 kmod-nfnetlink kmod-nls-base kmod-ppp kmod-pppoe kmod-pppox kmod-scsi-core kmod-slhc kmod-tun kmod-udptunnel4 kmod-udptunnel6 kmod-usb-core kmod-usb-dwc3 kmod-usb-dwc3-qcom kmod-usb-ehci kmod-usb-ledtrig-usbport kmod-usb-net kmod-usb-net-cdc-eem kmod-usb-net-cdc-ether

    opkg install kmod-usb-net-cdc-ncm kmod-usb-net-cdc-subset kmod-usb-net-ipheth kmod-usb-storage kmod-usb2 kmod-usb3 kmod-wireguard libatomic1 libattr libavahi-client minidlna mtd netifd odhcp6c odhcpd-ipv6only openssh-sftp-client

    opkg install openwrt-keyring opkg ppp ppp-mod-pppoe procd resolveip rpcd rpcd-mod-file rpcd-mod-iwinfo rpcd-mod-luci rpcd-mod-rrdns swconfig terminfo ubi-utils uboot-envtools ubox ubus ubusd uci uclient-fetch uhttpd uhttpd-mod-ubus

    opkg install urandom-seed urngd usbids usbmuxd usbutils usign watchcat wireguard-tools wireless-regdb wpad-basic-wolfssl

    opkg install zlib kmod-usb-storage block-mount luci-app-minidlna kmod-fs-ext4 kmod-fs-exfat fdisk luci-compat luci-lib-ipkg luci-proto-wireguard luci-app-wireguard luci-i18n-wireguard-en watchcat wg-installer-client

    opkg install luci-app-watchcat

    opkg install curl git git-http wget jq

    ## V2RAYA INSTALLER ##
    echo "Installing V2rayA..."
    ## download

    opkg update; opkg install unzip wget-ssl

    ## Remove DNSMasq

    #opkg remove dnsmasq

    #opkg install dnsmasq-full

    #opkg install v2raya

    #opkg install /etc/luci-app-v2raya_6_all.ipk

    # Switch back to https
    sed -i 's,http,https,g' /etc/opkg/distfeeds.conf;
}

autoprovisionStage2()
{
    log "Autoprovisioning stage2 speaking"

    # TODO this is a rather sloppy way to test whether stage2 has been done already, but this is a shell script...
    if [ $(uci get system.@system[0].log_type) == "file" ]; then
        log "Seems like autoprovisioning stage2 has been done already. Running stage3."
        #/root/autoprovision-stage3.py
    else
        signalAutoprovisionWorking

	echo Updating system time using ntp; otherwise the openwrt.org certificates are rejected as not yet valid.
        ntpd -d -q -n -p 0.openwrt.pool.ntp.org

        # CUSTOMIZE: with an empty argument it will set a random password and only ssh key based login will work.
        # please note that stage2 requires internet connection to install packages and you most probably want to log in
        # on the GUI to set up a WAN connection. but on the other hand you don't want to end up using a publically
        # available default password anywhere, therefore the random here...
        #setRootPassword ""

        installPackages

        cat >${overlay_root}/etc/rc.local <<EOF
chmod a+x /etc/stage3.sh
bash /etc/stage3.sh || exit 1
EOF

        mkdir -p /var/log/archive

        # logrotate is complaining without this directory
        mkdir -p /var/lib

        uci set system.@system[0].log_type=file
        uci set system.@system[0].log_file=/var/log/syslog
        uci set system.@system[0].log_size=0

        uci commit
        sync
        reboot
    fi
}

autoprovisionStage2
