#!/bin/bash
# 检查参数是否存在，如果没有参数，给出错误提示
echo "开始执行重设脚本"
if [ -z "$1" ]
  then
    echo "错误：请提供 URL 参数！格式为 bash reseticbc.sh URL1,URL2,URL3 用户名1,用户名2,用户名3 密码1,密码2,密码3"
    exit 1
fi
if [ -z "$2" ]
  then
    echo "错误：请提供 URL 参数！格式为 bash reseticbc.sh URL1,URL2,URL3 用户名1,用户名2,用户名3 密码1,密码2,密码3"
    exit 1
fi
if [ -z "$3" ]
  then
    echo "错误：请提供 URL 参数！格式为 bash reseticbc.sh URL1,URL2,URL3 用户名1,用户名2,用户名3 密码1,密码2,密码3"
    exit 1
fi

# 使用$1访问传入的参数并将其显示出来
echo "URL为：$1, 用户名为: $2, 密码为: $3"

wget -O /root/icbc.sh https://raw.githubusercontent.com/misyili/pt/main/icbc/icbc.sh

sed -i "3i PASSWORD=$3" /root/icbc.sh
sed -i "3i USERNAME=$2" /root/icbc.sh
sed -i "3i URL=$1" /root/icbc.sh

echo "配置替换完成! 即将开始执行, 如果没有弹出日志, 请手动输入以下命令查看: tail -f /data/icbc.log"

bash icbc.sh | tail -f /data/icbc.log