#!/bin/bash

# 进入 OpenWrt 源码根目录
cd openwrt

# --- TTYD 免登录配置 ---
sed -i 's|/bin/login|/bin/login -f root|g' feeds/packages/utils/ttyd/files/ttyd.config

# --- 添加 turboacc 加速插件 ---
# curl -sSL https://raw.githubusercontent.com/mufeng05/turboacc/main/add_turboacc.sh -o add_turboacc.sh && bash add_turboacc.sh# 
# cd $GITHUB_WORKSPACE

echo "🔧 正在修复 Rust 下载 CI LLVM 的问题..."
RUST_MK=$(find . -type f -name "Makefile" -path "*/rust/*" | grep -E "rust/Makefile$" | head -1)
if [ -n "$RUST_MK" ]; then
    sed -i 's/--set=llvm.download-ci-llvm=true/--set=llvm.download-ci-llvm=false/g' "$RUST_MK"
    echo "✅ 已修改 $RUST_MK"
else
    echo "⚠️ 未找到 rust 的 Makefile，跳过修复"
fi
