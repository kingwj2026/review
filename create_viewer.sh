#/bin/bash
IP=`ip a | grep eth0 | grep inet | awk '{print $2}' | awk -F'/' '{print $1}'`
#创建账号并添加到中转
NEWPWD=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 16 | head -n 1)
echo $NEWPWD | passwd viewer --stdin || exit
curl --insecure -d "ext_ip=$IP&account=viewer&passwd=$NEWPWD" https://172.16.4.231/ssh_proxy/ajax/host_push.php
