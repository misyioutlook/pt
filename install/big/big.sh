#!/bin/bash
# 安装工具
apt-get install expect -y

sudo wget -O parted.exp https://raw.githubusercontent.com/misyioutlook/pt/main/install/big/parted.exp && chmod +x parted.exp
sudo wget -O fdisk.exp https://raw.githubusercontent.com/misyioutlook/pt/main/install/big/fdisk.exp && chmod +x fdisk.exp

expect parted.exp "b"
expect fdisk.exp "b"

sleep 2

mkfs.ext4 /dev/sdb1

mkdir /down

mount /dev/md0 /down

chmod 777 /down

tune2fs -m 0 /dev/md0

#读取md0的uuid
sdb1_uuid=$(blkid -s UUID -o value /dev/sdb1)

#写入到fstab启动文件
echo "UUID=$sdb1_uuid /down ext4 defaults 0 0" >> /etc/fstab