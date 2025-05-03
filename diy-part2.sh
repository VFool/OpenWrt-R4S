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

# 添加 UA2F
#git clone --depth=1 https://github.com/EOYOHOO/UA2F.git package/UA2F

# 修改 argon 为默认主题
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# 删除原默认主题
rm -rf package/lean/luci-theme-bootstrap

# TTYD 免登录
sed -i 's|/bin/login|/bin/login -f root|g' feeds/packages/utils/ttyd/files/ttyd.config

# 修改插件名字
sed -i 's/"风扇通用控制小程序"/"风扇控制"/g' `egrep "风扇通用控制小程序" -rl ./`
sed -i 's/"FileBrowser"/"文件管理"/g' `egrep "FileBrowser" -rl ./`
