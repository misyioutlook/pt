#!/bin/bash
# 安装工具
apt install expect -y
apt install parted -y

sudo wget -O parted_b.exp https://raw.githubusercontent.com/misyioutlook/pt/main/install/big/parted_b.exp && chmod +x parted_b.exp
sudo wget -O fdisk_b.exp https://raw.githubusercontent.com/misyioutlook/pt/main/install/big/fdisk_b.exp && chmod +x fdisk_b.exp

expect parted_b.exp
expect fdisk_b.exp

sleep 1

mkfs.ext4 /dev/sdb1

mkdir /down

mount /dev/sdb1 /down

chmod 777 /down

tune2fs -m 0 /dev/sdb1

#读取md0的uuid
sdb1_uuid=$(blkid -s UUID -o value /dev/sdb1)

#写入到fstab启动文件
echo "UUID=$sdb1_uuid /down ext4 defaults 0 0" >> /etc/fstab

rm parted_b.exp
rm fdisk_b.exp
rm big.sh

lsblk

sleep 5

docker rm -f fb3 && docker run -d --name fb3 -v /down:/myfiles -v /root/filebrowser/config:/config -e PUID=$(id -u) -e PGID=$(id -g) -p 18245:8088 --restart=always 80x86/filebrowser:latest

sed -i 's#Downloads\\SavePath=/home/felens/qbittorrent/Downloads/#Downloads\\SavePath=/down/#' /home/felens/.config/qBittorrent/qBittorrent.conf

systemctl restart qbittorrent-nox@felens

sleep 1

echo "===== 全部安装完成, 请使用 sudo mount -a 检查后, 再手动重启 ===="

#reboot
