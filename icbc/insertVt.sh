#!/bin/bash
if [ -z "$1" ]
  then
    echo "错误：请提供 vertex 的路径, 例如 /root/vertex 则后面的参数为 /root"
    exit 1
fi

# 插入删种规则
wget -O "$1"/vertex/data/rule/delete/3d533e9b.json https://raw.githubusercontent.com/misyili/pt/main/icbc/delete/3d533e9b.json
wget -O "$1"/vertex/data/rule/delete/6eda7976.json https://raw.githubusercontent.com/misyili/pt/main/icbc/delete/6eda7976.json
wget -O "$1"/vertex/data/rule/delete/8f1a0ce9.json https://raw.githubusercontent.com/misyili/pt/main/icbc/delete/8f1a0ce9.json
wget -O "$1"/vertex/data/rule/delete/69a1b99e.json https://raw.githubusercontent.com/misyili/pt/main/icbc/delete/69a1b99e.json
wget -O "$1"/vertex/data/rule/delete/349ed2e6.json https://raw.githubusercontent.com/misyili/pt/main/icbc/delete/349ed2e6.json
wget -O "$1"/vertex/data/rule/delete/500c4fb9.json https://raw.githubusercontent.com/misyili/pt/main/icbc/delete/500c4fb9.json
wget -O "$1"/vertex/data/rule/delete/2839f7bd.json https://raw.githubusercontent.com/misyili/pt/main/icbc/delete/2839f7bd.json
wget -O "$1"/vertex/data/rule/delete/a2ec9b69.json https://raw.githubusercontent.com/misyili/pt/main/icbc/delete/a2ec9b69.json
wget -O "$1"/vertex/data/rule/delete/cc40c639.json https://raw.githubusercontent.com/misyili/pt/main/icbc/delete/cc40c639.json
wget -O "$1"/vertex/data/rule/delete/d9e877ac.json https://raw.githubusercontent.com/misyili/pt/main/icbc/delete/d9e877ac.json
wget -O "$1"/vertex/data/rule/delete/d197ca0b.json https://raw.githubusercontent.com/misyili/pt/main/icbc/delete/d197ca0b.json
wget -O "$1"/vertex/data/rule/delete/e9ebe3b7.json https://raw.githubusercontent.com/misyili/pt/main/icbc/delete/e9ebe3b7.json
wget -O "$1"/vertex/data/rule/delete/e94438fc.json https://raw.githubusercontent.com/misyili/pt/main/icbc/delete/e94438fc.json

# 插入选种规则
wget -O "$1"/vertex/data/rule/rss/81cfe020.json https://raw.githubusercontent.com/misyili/pt/main/icbc/rss/81cfe020.json

# 插入下载器
wget -O "$1"/vertex/data/client/d9474cb4.json https://raw.githubusercontent.com/misyili/pt/main/icbc/client/d9474cb4.json
wget -O "$1"/vertex/data/client/d8164471.json https://raw.githubusercontent.com/misyili/pt/main/icbc/client/d8164471.json

# 插入RSS
wget -O "$1"/vertex/data/rss/ae68f55d.json https://raw.githubusercontent.com/misyili/pt/main/icbc/rssTask/ae68f55d.json
