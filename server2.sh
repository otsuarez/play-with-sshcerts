#!/bin/bash

yum -y install openssh-server openssh-clients
systemctl restart sshd

cat <<_EOF_> /etc/ssh/ssh_known_hosts
@cert-authority * $(cat /root/shared/ssh-ca/server_ca.pub)
_EOF_


ssh-keygen -f /root/.ssh/id_rsa -N ''
# using server_ca from server1
ssh-keygen -s /root/shared/ssh-ca/server_ca -I user_root -n root -V +52w ~/.ssh/id_rsa.pub
