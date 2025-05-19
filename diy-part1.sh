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

echo '

define KernelPackage/xdp-sockets-diag
  SUBMENU:=$(NETWORK_SUPPORT_MENU)
  TITLE:=PF_XDP sockets monitoring interface support for ss utility
  KCONFIG:= \
	CONFIG_XDP_SOCKETS=y \
	CONFIG_XDP_SOCKETS_DIAG
  FILES:=$(LINUX_DIR)/net/xdp/xsk_diag.ko
  AUTOLOAD:=$(call AutoLoad,31,xsk_diag)
endef

define KernelPackage/xdp-sockets-diag/description
 Support for PF_XDP sockets monitoring interface used by the ss tool
endef

$(eval $(call KernelPackage,xdp-sockets-diag))
' >> package/kernel/linux/modules/netsupport.mk


echo '

CONFIG_PACKAGE_kmod-xdp-sockets-diag=y
' >> .config
