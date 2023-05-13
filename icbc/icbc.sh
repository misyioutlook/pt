#!/bin/bash

echo "ICBC-爱拆不拆  开始更新"
wget -O /root/icbc.jar https://github.com/misyili/pt/raw/main/icbc/icbc.jar


JAVA_MEM_OPTS="-Xmx256m -XX:MaxMetaspaceSize=128m -XX:CompressedClassSpaceSize=24m"
SPRING_PROFILES_ACTIV="-Durl=$URL -Dusername=$USERNAME -Dpassword=$PASSWORD -Dfile.encoding=utf-8"
JAR_PATH="/root/icbc.jar"
JAR_NAME="icbc"

echo "jar 包路径: $JAR_PATH"

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


nohup java -javaagent:$JAR_PATH  $JAVA_MEM_OPTS -jar $SPRING_PROFILES_ACTIV $JAR_PATH >/dev/null 2>&1 &

COUNT=0
while [ $COUNT -lt 1 ]; do
  sleep 1
  COUNT=`ps --no-heading -C java -f --width 1000 | grep "$JAR_NAME" | awk '{print $2}' | wc -l`
  if [ $COUNT -gt 0 ]; then
    break
  fi
done
PIDS=`ps --no-heading -C java -f --width 1000 | grep "$JAR_NAME" | awk '{print $2}'`

export LANG=en_US.UTF-8
echo "${JAR_NAME} Started and the PID is ${PIDS}."