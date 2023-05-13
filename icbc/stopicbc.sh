#!/bin/bash
JAR_NAME="icbc"
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

