#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default
# sed -i '1i src-git danshui https://github.com/281677160/openwrt-package.git;immortalwrt' feeds.conf.default
# sed -i '2i src-git dstheme https://github.com/281677160/openwrt-package.git;Theme2' feeds.conf.default
#echo 'src-git alist https://github.com/sbwml/luci-app-alist' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
# echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
# echo 'src-git kenzo https://github.com/kenzok8/openwrt-packages' >>feeds.conf.default   
# echo 'src-git small https://github.com/kenzok8/small' >>feeds.conf.default
git clone https://github.com/sbwml/luci-app-mosdns -b v5 package/mosdns
git clone https://github.com/sbwml/v2ray-geodata package/v2ray-geodata


# 为adguardhome alist passwall插件更换最新的版本
rm -rf feeds/packages/net/{alist,adguardhome,chinadns-ng,dns2socks,geoview,hysteria,ipt2socks,microsocks,naiveproxy,shadowsocks-libev,shadowsocksr-libev,simple-obfs,sing-box,tcping,trojan-plus,tuic-client,v2ray-geodata,v2ray-plugin,xray-core,xray-plugin}
rm -rf feeds/luci/applications/{luci-app-adguardhome,luci-app-alist,luci-app-passwall}   
git clone https://github.com/leshanydy2022/luci-app-adguardhome.git feeds/luci/applications/luci-app-adguardhome
git clone https://github.com/leshanydy2022/adguardhome.git feeds/packages/net/adguardhome
git clone https://github.com/xiaorouji/openwrt-passwall-packages feeds/luci-app-passwall-packages
mv ./feeds/luci-app-passwall-packages/{dns2socks,geoview,hysteria,ipt2socks,microsocks,naiveproxy,shadowsocks-libev,shadowsocksr-libev,simple-obfs,sing-box,tcping,trojan-plus,tuic-client,v2ray-geodata,v2ray-plugin,xray-core,xray-plugin,chinadns-ng} ./feeds/packages/net
rm -rf feeds/luci-app-passwall-packages
git clone https://github.com/sbwml/luci-app-alist package/alist
mv ./package/alist/alist ./feeds/packages/net
mv ./package/alist/luci-app-alist feeds/luci/applications/
git clone https://github.com/xiaorouji/openwrt-passwall package/luci-app-passwall
mv ./package/luci-app-passwall feeds/luci/applications/
