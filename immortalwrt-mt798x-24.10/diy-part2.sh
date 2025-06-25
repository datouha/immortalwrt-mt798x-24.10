#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# 解决冲突（适用于kenzok8插件源码）
# rm -rf feeds/luci/applications/luci-app-mosdns
# rm -rf feeds/packages/net/{alist,adguardhome,mosdns,xray*,v2ray*,v2ray*,sing*,smartdns}
# rm -rf feeds/packages/utils/v2dat
# rm -rf feeds/packages/lang/golang
# git clone https://github.com/kenzok8/golang feeds/packages/lang/golang

# 设置主路由静态IP
# sed -i 's/192.168.1.1/192.168.6.1/g' package/base-files/files/bin/config_generate

# 设置密码为空
sed -i '/CYXluq4wUazHjmCDBCqXF/d' package/lean/default-settings/files/zzz-default-settings

# 安装新主题 luci-theme-bootstrap-mod
# git clone https://github.com/leshanydy2022/luci-theme-bootstrap-mod.git package/lean/luci-theme-bootstrap-mod
# sed -i 's/luci-theme-bootstrap/luci-theme-bootstrap-mod/g' feeds/luci/collections/luci/Makefile

# 安装luci-app-smartdns和luci-app-adguardhome
# rm -rf feeds/luci/applications/luci-app-smartdns
rm -rf feeds/luci/applications/luci-app-adguardhome
# git clone https://github.com/leshanydy2022/luci-app-smartdns.git feeds/luci/applications/luci-app-smartdns
git clone https://github.com/leshanydy2022/luci-app-adguardhome.git package/lean/luci-app-adguardhome

# 为adguardhome插件更换最新的版本
rm -rf feeds/packages/net/adguardhome
git clone https://github.com/leshanydy2022/adguardhome.git feeds/packages/net/adguardhome

# 安装uugamebooster
# rm -rf feeds/luci/applications/luci-app-uugamebooster
# git clone https://github.com/datouha/luci-app-uugamebooster.git package/lean/luci-app-uugamebooster
# rm -rf feeds/packages/net/uugamebooster
# git clone https://github.com/datouha/uugamebooster.git feeds/packages/net/uugamebooster



# ---------------------------------------------------------------
## OpenClash
# git clone -b v0.46.086 --depth=1 https://github.com/vernesong/openclash.git OpenClash
# rm -rf feeds/luci/applications/luci-app-openclash
# mv OpenClash/luci-app-openclash feeds/luci/applications/luci-app-openclash
# ---------------------------------------------------------------

# ##------------- meta core ---------------------------------
# wget https://github.com/MetaCubeX/mihomo/releases/download/v1.19.9/mihomo-linux-arm64-v1.19.9.gz
# gzip -d mihomo-linux-arm64-v1.19.9.gz
# chmod +x mihomo-linux-arm64-v1.19.9 >/dev/null 2>&1
# mkdir -p feeds/luci/applications/luci-app-openclash/root/etc/openclash/core
# mv mihomo-linux-arm64-v1.19.9 feeds/luci/applications/luci-app-openclash/root/etc/openclash/core/clash_meta >/dev/null 2>&1
# ##---------------------------------------------------------

# ##-------------- GeoIP 数据库 -----------------------------
# curl -sL -m 30 --retry 2 https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat -o /tmp/GeoIP.dat
# mv /tmp/GeoIP.dat feeds/luci/applications/luci-app-openclash/root/etc/openclash/GeoIP.dat >/dev/null 2>&1
# ##---------------------------------------------------------

# ##-------------- GeoSite 数据库 ---------------------------
# curl -sL -m 30 --retry 2 https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat -o /tmp/GeoSite.dat
# mv -f /tmp/GeoSite.dat feeds/luci/applications/luci-app-openclash/root/etc/openclash/GeoSite.dat >/dev/null 2>&1

# 为smartDNS插件更换最新的版本
# rm -rf feeds/packages/net/smartdns
# git clone https://github.com/leshanydy2022/smartdns.git feeds/packages/net/smartdns

# Modify hostname
# sed -i 's/ImmortalWrt/ImmortalWrt-YDY/g' package/base-files/files/bin/config_generate

# Modify filename, add date prefix
#sed -i 's/IMG_PREFIX:=/IMG_PREFIX:=$(shell date +"%Y%m%d")-/1' include/image.mk

# Modify ppp-down, add sleep 3
# sed -i '$a\\\nsleep 3' package/network/services/ppp/files/lib/netifd/ppp-down
