#!/bin/bash
# 检查参数是否存在，如果没有参数，给出错误提示
echo "ICBC-爱拆不拆  开始安装"
if [ -z "$1" ]
  then
    echo "错误：请提供 URL 参数！格式为 bash icbcinstall.sh URL1,URL2,URL3 用户名1,用户名2,用户名3 密码1,密码2,密码3"
    exit 1
fi
if [ -z "$2" ]
  then
    echo "错误：请提供 URL 参数！格式为 bash icbcinstall.sh URL1,URL2,URL3 用户名1,用户名2,用户名3 密码1,密码2,密码3"
    exit 1
fi
if [ -z "$3" ]
  then
    echo "错误：请提供 URL 参数！格式为 bash icbcinstall.sh URL1,URL2,URL3 用户名1,用户名2,用户名3 密码1,密码2,密码3"
    exit 1
fi

# 使用$1访问传入的参数并将其显示出来
echo "URL为：$1, 用户名为: $2, 密码为: $3"

wget -O /root/icbc.sh https://raw.githubusercontent.com/misyili/pt/main/icbc/icbc.sh
wget -O /root/stopicbc.sh https://raw.githubusercontent.com/misyili/pt/main/icbc/stopicbc.sh
wget -O /root/reseticbc.sh https://raw.githubusercontent.com/misyili/pt/main/icbc/reseticbc.sh

sed -i "3i PASSWORD=$3" /root/icbc.sh
sed -i "3i USERNAME=$2" /root/icbc.sh
sed -i "3i URL=$1" /root/icbc.sh

# 安装 JAVA 环境
if java -version >/dev/null 2>&1; then
  echo "Java is already installed."
else
  echo "Java is not installed. Installing now..."
  # Update package list
  sudo apt update
  # Install default JRE
  echo -e "Y\n" | sudo apt install default-jre
  echo "Java installation complete."
fi


# 插入删种规则
wget -O /root/vertex/data/rule/delete/3d533e9b.json https://raw.githubusercontent.com/misyili/pt/main/icbc/delete/3d533e9b.json
wget -O /root/vertex/data/rule/delete/6eda7976.json https://raw.githubusercontent.com/misyili/pt/main/icbc/delete/6eda7976.json
wget -O /root/vertex/data/rule/delete/8f1a0ce9.json https://raw.githubusercontent.com/misyili/pt/main/icbc/delete/8f1a0ce9.json
wget -O /root/vertex/data/rule/delete/69a1b99e.json https://raw.githubusercontent.com/misyili/pt/main/icbc/delete/69a1b99e.json
wget -O /root/vertex/data/rule/delete/349ed2e6.json https://raw.githubusercontent.com/misyili/pt/main/icbc/delete/349ed2e6.json
wget -O /root/vertex/data/rule/delete/500c4fb9.json https://raw.githubusercontent.com/misyili/pt/main/icbc/delete/500c4fb9.json
wget -O /root/vertex/data/rule/delete/2839f7bd.json https://raw.githubusercontent.com/misyili/pt/main/icbc/delete/2839f7bd.json
wget -O /root/vertex/data/rule/delete/a2ec9b69.json https://raw.githubusercontent.com/misyili/pt/main/icbc/delete/a2ec9b69.json
wget -O /root/vertex/data/rule/delete/cc40c639.json https://raw.githubusercontent.com/misyili/pt/main/icbc/delete/cc40c639.json
wget -O /root/vertex/data/rule/delete/d9e877ac.json https://raw.githubusercontent.com/misyili/pt/main/icbc/delete/d9e877ac.json
wget -O /root/vertex/data/rule/delete/d197ca0b.json https://raw.githubusercontent.com/misyili/pt/main/icbc/delete/d197ca0b.json
wget -O /root/vertex/data/rule/delete/e9ebe3b7.json https://raw.githubusercontent.com/misyili/pt/main/icbc/delete/e9ebe3b7.json
wget -O /root/vertex/data/rule/delete/e94438fc.json https://raw.githubusercontent.com/misyili/pt/main/icbc/delete/e94438fc.json

# 插入选种规则
wget -O /root/vertex/data/rule/rss/81cfe020.json https://raw.githubusercontent.com/misyili/pt/main/icbc/rss/81cfe020.json

# 插入下载器
wget -O /root/vertex/data/client/d9474cb4.json https://raw.githubusercontent.com/misyili/pt/main/icbc/client/d9474cb4.json
wget -O /root/vertex/data/client/d8164471.json https://raw.githubusercontent.com/misyili/pt/main/icbc/client/d8164471.json

# 插入RSS
wget -O /root/vertex/data/rss/ae68f55d.json https://raw.githubusercontent.com/misyili/pt/main/icbc/rssTask/ae68f55d.json

# 执行脚本
if [ ! -d "/data" ]; then mkdir -p "/data"; fi
if [ ! -f /data/icbc.log ]; then
  touch /data/icbc.log
fi

chmod +x stopicbc.sh
chmod +x reseticbc.sh
echo "脚本全部安装完毕! 即将开始执行, 如果没有弹出日志, 请手动输入以下命令查看: tail -f /data/icbc.log"

bash icbc.sh | tail -f /data/icbc.log