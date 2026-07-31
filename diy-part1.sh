#!/bin/bash

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source

#添加风扇控制程序
echo "src-git fancontrol https://github.com/JiaY-shi/fancontrol.git" >> feeds.conf
