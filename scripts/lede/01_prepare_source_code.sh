#!/bin/bash

. ./scripts/funcations.sh

clone_repo $lede_repo master openwrt &
clone_repo $immortalwrt_pkg_repo openwrt-18.06 immortalwrt_pkg_18.06 &
clone_repo $passwall_pkg_repo main passwall_pkg &
clone_repo $passwall_luci_repo main passwall_luci &
clone_repo $lienol_pkg_repo main Lienol_pkg &
clone_repo $mosdns_repo v5 mosdns &
clone_repo $mosdns_pkg master mosdns_pkg &
clone_repo $sirpdboy_repo main sirpdboy &
clone_repo $openclash_repo master openclash &
clone_repo $lienol_pkg_repo main lienol_pkg &

wait

# Modify default IP (FROM 192.168.1.1 CHANGE TO 192.168.1.99 )
sed -i 's/192.168.1.1/192.168.1.99/g' openwrt/package/base-files/files/bin/config_generate

exit 0
