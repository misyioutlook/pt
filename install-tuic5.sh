#!/bin/bash
if [ -z "$1" ]; then
  echo "请添加域名前缀!!"
  exit 1
fi

curl https://get.acme.sh | sh
~/.acme.sh/acme.sh --register-account -m misyi.licong@gmail.com
~/.acme.sh/acme.sh  --issue -d "$1".misyi.top   --standalone
mkdir ygkkkca
~/.acme.sh/acme.sh --installcert -d "$1".misyi.top --key-file /root/ygkkkca/private.key --fullchain-file /root/ygkkkca/cert.crt

#echo -e "1\n"
#echo -e "N\nN\nN\nY\n"  | bash <(wget -qO- https://gitlab.com/rwkgyg/tuic-yg/raw/main/tuic.sh 2> /dev/null)