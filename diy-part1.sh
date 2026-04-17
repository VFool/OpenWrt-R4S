
# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source

#添加风扇控制程序
echo 'src-git fancontrol https://github.com/DHDAXCW/dhdaxcw-app' >>feeds.conf.default

#添加Turbe Acc
#curl -sSL https://raw.githubusercontent.com/chenmozhijin/turboacc/luci/add_turboacc.sh -o add_turboacc.sh && bash add_turboacc.sh --no-sfe
