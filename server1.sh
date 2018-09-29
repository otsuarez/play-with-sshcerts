#!/bin/bash

yum -y install openssh-server openssh-clients
systemctl restart sshd

# Creating the CA key
cd /root/shared
mkdir ssh-ca
cd ssh-ca
# will avoid asking for a passphrase but PLEASE DO USE A PASSPHRASE FOR YOUR PERSONAL KEY
ssh-keygen -f server_ca -N ''
# 52 weeks = 1 year ...
ssh-keygen -s server_ca -I key_for_test1 -h -n server1 -V +52w /etc/ssh/ssh_host_rsa_key.pub
echo "HostCertificate /etc/ssh/ssh_host_rsa_key-cert.pub" >> /etc/ssh/sshd_config
systemctl restart sshd

# client keys
cp /root/shared/ssh-ca/server_ca.pub /etc/ssh/
echo "TrustedUserCAKeys /etc/ssh/server_ca.pub" >> /etc/ssh/sshd_config
systemctl restart sshd
