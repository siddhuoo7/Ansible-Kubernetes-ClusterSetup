#!/bin/bash
#ssh-keygen -t rsa
#enable below line to create a passwordless ssh-key
#ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa <<< y
echo "root@$2"
yum install sshpass -y
sshpass -p $1 ssh-copy-id -o StrictHostKeyChecking=no root@$2
sshpass -p $1 ssh-copy-id -o StrictHostKeyChecking=no root@$3
sshpass -p $1 ssh-copy-id -o StrictHostKeyChecking=no root@$4
sshpass -p $1 ssh-copy-id -o StrictHostKeyChecking=no root@$5
cat ~/.ssh/id_rsa.pub |sshpass -p $1 ssh  root@$2 "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys"
cat ~/.ssh/id_rsa.pub |sshpass -p $1 ssh   root@$3 "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys"
cat ~/.ssh/id_rsa.pub |sshpass -p $1 ssh   root@$4 "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys"
cat ~/.ssh/id_rsa.pub |sshpass -p $1 ssh   root@$5 "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys"