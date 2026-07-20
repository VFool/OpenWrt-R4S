#!/bin/bash

# 进入 OpenWrt 源码根目录
cd openwrt

# --- TTYD 免登录配置 ---
sed -i 's|/bin/login|/bin/login -f root|g' feeds/packages/utils/ttyd/files/ttyd.config

# --- 添加 turboacc 加速插件 ---
curl -sSL https://raw.githubusercontent.com/mufeng05/turboacc/main/add_turboacc.sh -o add_turboacc.sh && bash add_turboacc.sh

# ---从分支名提取版本号---
BRANCH_VERSION=$(echo "$REPO_BRANCH" | sed 's/^openwrt-//')
[ -z "$BRANCH_VERSION" ] && BRANCH_VERSION=$(date +%Y%m%d)
echo "CONFIG_VERSION_NUMBER=\"$BRANCH_VERSION\"" >> .config
echo "CONFIG_VERSION_RELEASE=\"r$(date +%Y%m%d)-$BRANCH_VERSION\"" >> .config
