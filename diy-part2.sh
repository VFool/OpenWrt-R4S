#!/bin/bash

# 进入 OpenWrt 源码根目录
cd openwrt

# --- TTYD 免登录配置 ---
sed -i 's|/bin/login|/bin/login -f root|g' feeds/packages/utils/ttyd/files/ttyd.config

# --- 添加 turboacc 加速插件 ---
curl -sSL https://raw.githubusercontent.com/chenmozhijin/turboacc/luci/add_turboacc.sh -o add_turboacc.sh && bash add_turboacc.sh --no-sfe
# 返回工作目录
cd $GITHUB_WORKSPACE
