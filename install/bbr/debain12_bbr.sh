#!/bin/bash

# 检查是否为 root 用户或具有 sudo 特权
if [[ $(id -u) -ne 0 ]]; then
  echo "请使用 root 用户或具有 sudo 特权来运行此脚本。"
  exit 1
fi

# 编辑 sysctl.conf 文件
echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf

# 使修改生效
sysctl -p

# 输出 BBR 启用状态
echo "BBR 已成功启用。"
sysctl net.ipv4.tcp_available_congestion_control
sysctl net.ipv4.tcp_congestion_control
