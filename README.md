# 



```
curl -fLO https://raw.githubusercontent.com/bohanyang/debi/master/debi.sh && chmod a+rx debi.sh
sudo ./debi.sh
```


## 自动拆包

- 教学地址: https://misyi.notion.site/2b13912824354908917640558af04bab


### 安装命令
```shell
# 第一步
sudo wget -O icbcinstall.sh https://raw.githubusercontent.com/misyili/pt/main/icbc/icbcinstall.sh && chmod +x icbcinstall.sh

# 第二步
bash icbcinstall.sh QB的IP:QB端口,QB的IP:QB端口 QB账号,QB账号 QB密码,QB密码
```

### 手动导入 vt 模板

```shell
sudo wget -O insertVt.sh https://raw.githubusercontent.com/misyili/pt/main/icbc/insertVt.sh && chmod +x insertVt.sh 

# 手动导入模板, 路径 /root 可以替换为自己的 vertex docker 路径
bash insertVt.sh /root
```

### 旧版一键切换为新版

```shell
sudo wget -O upgrade.sh https://raw.githubusercontent.com/misyili/pt/main/icbc/upgrade.sh && bash upgrade.sh 
```


