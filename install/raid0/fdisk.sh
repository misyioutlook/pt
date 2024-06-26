#!/bin/bash

if [[ $# -eq 0 ]]; then
  echo "请提供硬盘数量!"
  exit 1
fi

param_count=$1
chars=("b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z" "aa" "ab" "ac" "ad" "ae" "af" "ag" "ah" "ai" "aj" "ak" "al" "am" "an" "ao" "ap" "aq" "ar" "as" "at" "au" "av" "aw" "ax" "ay" "az")

if [[ $param_count -lt 1 || $param_count -gt 52 ]]; then
  echo "参数个数必须在 1-51 范围内"
  exit 1
fi

# 根据参数个数设置数组
selected_chars=("${chars[@]:0:param_count}")

# 安装工具
apt-get install expect -y

sudo wget -O fdisk.exp https://raw.githubusercontent.com/misyioutlook/pt/main/install/raid0/fdisk.exp && chmod +x fdisk.exp

for char in "${selected_chars[@]}"; do
  expect fdisk.exp $char
done

rm fdisk.exp
rm fdisk.sh