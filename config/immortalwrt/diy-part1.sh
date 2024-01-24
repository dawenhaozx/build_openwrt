#!/bin/bash
#========================================================================================================================
# https://github.com/ophub/amlogic-s9xxx-openwrt
# Description: Automatically Build OpenWrt
# Function: Diy script (Before Update feeds, Modify the default IP, hostname, theme, add/remove software packages, etc.)
# Source code repository: https://github.com/immortalwrt/immortalwrt / Branch: master
#========================================================================================================================

# Add a feed source
# sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default

# other
# rm -rf package/emortal/{autosamba,ipv6-helper}
#passwall2
#echo "src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages.git;main" >> feeds.conf.default
#echo "src-git passwall2 https://github.com/xiaorouji/openwrt-passwall2.git;main" >> feeds.conf.default

git clone -q --single-branch --depth=1 --branch=openwrt-22.03 https://github.com/openwrt/openwrt.git openwrt_22
rm -rf package/network/utils/iptables
cp -rf openwrt_22/package/network/utils/iptables package/network/utils/iptables
rm -rf openwrt_22
wget -P package/network/utils/iptables/patches/ https://github.com/coolsnowwolf/lede/raw/master/package/network/utils/iptables/patches/900-bcm-fullconenat.patch