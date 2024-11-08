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

sleep 5

apt-get install mdadm -y

selected_chars=("${chars[@]:0:param_count}")

mdadm_command="mdadm -Cv /dev/md0 -l0 -n$param_count"

for char in "${selected_chars[@]}"; do
  mdadm_command+=" /dev/sd$char"1
done

echo "构建的 mdadm 命令为："
echo "$mdadm_command"

# 执行构建的 mdadm 命令
eval "$mdadm_command"

mkfs.ext4 /dev/md0

mkdir /down

mount /dev/md0 /down

chmod 777 /down

tune2fs -m 0 /dev/md0

#读取md0的uuid
md0_uuid=$(blkid -s UUID -o value /dev/md0)

#写入到fstab启动文件
echo "UUID=$md0_uuid /down ext4 defaults,nofail,_netdev 0 0" >> /etc/fstab


rm fdisk.exp
rm raid0.sh