#!/bin/bash

wget -O /root/icbc.sh https://raw.githubusercontent.com/misyioutlook/pt/main/icbc/icbc.sh
wget -O /root/stopicbc.sh https://raw.githubusercontent.com/misyioutlook/pt/main/icbc/stopicbc.sh
wget -O /root/reseticbc.sh https://raw.githubusercontent.com/misyioutlook/pt/main/icbc/reseticbc.sh

# 导入配置
sed -i '' -e '2 r /dev/stdin' icbc.sh <<< "$(grep '^URL=\|^USERNAME=\|^PASSWORD=' pack.sh)"

# 执行脚本
if [ ! -d "/data" ]; then mkdir -p "/data"; fi
if [ ! -f /data/icbc.log ]; then
  touch /data/icbc.log
fi

chmod +x stopicbc.sh
chmod +x reseticbc.sh

# 停止旧版
JAR_NAME="qbunpack"
# 找到原进程,kill
PIDS=`ps --no-heading -C java -f --width 1000 | grep $JAR_NAME | awk '{print $2}'`
if [ -z "$PIDS" ]; then
  echo "INFO:The $JAR_NAME does not started!"
else
  echo -e "Stopping the $JAR_NAME..."

  for PID in $PIDS; do
    kill $PID > /dev/null 2>&1
  done

  COUNT=0
  while [ $COUNT -lt 1 ]; do
    sleep 1
    COUNT=1
    for PID in $PIDS ; do
      PID_EXIST=`ps --no-heading -p $PID`
      if [ -n "$PID_EXIST" ]; then
        COUNT=0
        break
      fi
    done
  done

  echo -e "${JAR_NAME} Stopped and the PID is ${PIDS}."
fi

# 删除文件
rm -rf /root/qbunpack.jar
rm -rf /root/qupInstall.sh
rm -rf /root/stoppack.sh

echo "脚本全部安装完毕! 即将开始执行, 如果没有弹出日志, 请手动输入以下命令查看: tail -f /data/icbc.log"

bash icbc.sh | tail -f /data/icbc.log