#!/bin/bash
#============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#============================================================

# Modify default IP
sed -i 's/192.168.1.1/192.168.6.1/g' package/base-files/files/bin/config_generate

# 为adguardhome alist passwall插件更换最新的版本
rm -rf feeds/packages/net/{adguardhome,chinadns-ng,dns2socks,geoview,hysteria,ipt2socks,microsocks,naiveproxy,shadowsocks-libev,shadowsocksr-libev,simple-obfs,sing-box,tcping,trojan-plus,tuic-client,v2ray-geodata,v2ray-plugin,xray-core,xray-plugin}
rm -rf feeds/luci/applications/{luci-app-adguardhome,luci-app-passwall}   
git clone https://github.com/leshanydy2022/luci-app-adguardhome.git package/lean/luci-app-adguardhome
git clone https://github.com/leshanydy2022/adguardhome.git feeds/packages/net/adguardhome
git clone https://github.com/xiaorouji/openwrt-passwall-packages feeds/luci-app-passwall-packages
mv ./feeds/luci-app-passwall-packages/{dns2socks,geoview,hysteria,ipt2socks,microsocks,naiveproxy,shadowsocks-libev,shadowsocksr-libev,simple-obfs,sing-box,tcping,trojan-plus,tuic-client,v2ray-geodata,v2ray-plugin,xray-core,xray-plugin,chinadns-ng} ./feeds/packages/net
rm -rf feeds/luci-app-passwall-packages
# git clone https://github.com/sbwml/luci-app-alist package/alist
# mv ./package/alist/alist ./feeds/packages/net
git clone https://github.com/xiaorouji/openwrt-passwall package/luci-app-passwall
