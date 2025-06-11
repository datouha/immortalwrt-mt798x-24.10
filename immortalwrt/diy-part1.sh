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
# git clone https://github.com/sbwml/luci-app-mosdns -b v5 package/mosdns
# git clone https://github.com/sbwml/v2ray-geodata package/v2ray-geodata

# add alist
# rm -rf feeds/packages/net/alist
# rm -rf feeds/luci/applications/luci-app-alist
# git clone https://github.com/sbwml/luci-app-alist feeds/alist
# mv ./feeds/alist/alist ./feeds/packages/net
# mv ./feeds/alist/luci-app-alist feeds/luci/applications/
# rm -rf feeds/alist

# Add uugamebooster
rm -rf feeds/luci/applications/luci-app-uugamebooster
rm -rf feeds/packages/net/uugamebooster
git clone https://github.com/datouha/uugamebooster.git feeds/1
mv ./feeds/1/uugamebooster ./feeds/packages/net
mv ./feeds/1/luci-app-uugamebooster ./feeds/luci/applications
rm -rf feeds/1

echo '

Source-Makefile: feeds/luci/applications/luci-app-uugamebooster/Makefile
Build-Depends: lua/host luci-base/host LUCI_CSSTIDY:csstidy/host LUCI_SRCDIET:luasrcdiet/host 

Package: luci-app-uugamebooster
Submenu: 3. Applications
Version: x
Depends: +libc +USE_GLIBC:librt +USE_GLIBC:libpthread +uugamebooster
Conflicts: 
Menu-Depends: 
Provides: 
Section: luci
Category: LuCI
Repository: base
Title: LuCI support for UUgamebooster
Maintainer: OpenWrt LuCI community
Source: 
Type: ipkg
Description: LuCI support for UUgamebooster
https://github.com/openwrt/luci
OpenWrt LuCI community
@@

Package: luci-i18n-uugamebooster-zh-cn
Default: LUCI_LANG_zh_Hans||(ALL&&m)
Version: x
Depends: +libc +USE_GLIBC:librt +USE_GLIBC:libpthread luci-app-uugamebooster
Conflicts: 
Menu-Depends: 
Provides: 
Section: luci
Category: LuCI
Repository: base
Title: luci-app-uugamebooster - zh-cn translation
Maintainer: 
Source: 
Type: ipkg
Hidden: 1
Description:     Translation for luci-app-uugamebooster - 简体中文 (Chinese Simplified)

@@
' >> feeds/luci.index

echo '

Source-Makefile: feeds/packages/net/uugamebooster/Makefile

Package: uugamebooster
Version: 8.8.12-1
Depends: +libc +USE_GLIBC:libpthread +kmod-tun @aarch64 @arm @mipsel @x86_64
Conflicts: 
Menu-Depends: 
Provides: 
Section: net
Category: Network
Repository: base
Title: NetEase UU Game Booster
Maintainer: 
Source: uugamebooster-8.8.12.tar.gz
License: Proprietary
Type: ipkg
Description: NetEase UU Game Booster Accelerates Triple-A Gameplay and Market.
https://uu.163.com

@@
' >> feeds/packages.index
