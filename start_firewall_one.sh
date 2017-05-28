#!/usr/bin/env bash
# Before running this script run install_docker.sh first.
# Only run this script once with sudo. Unexpected problems might occur of run
# more than once.

sudo ufw enable
sudo ufw allow ssh
sudo ufw allow 80

# source: https://svenv.nl/unixandlinux/dockerufw
echo 'Setting default forward policy to: DEFAULT_FORWARD_POLICY="ACCEPT"'
infile='DEFAULT_FORWARD_POLICY="DROP"'
tofile='DEFAULT_FORWARD_POLICY="ACCEPT"'
sudo sed -i "s/$infile/$tofile/g" /etc/default/ufw
sudo ufw reload

echo 'Setting docker opts to: DOCKER_OPTS="--dns 8.8.8.8 --dns 8.8.4.4 —iptables=false"'
infile='#DOCKER_OPTS="--dns 8.8.8.8 --dns 8.8.4.4"'
tofile='DOCKER_OPTS="--dns 8.8.8.8 --dns 8.8.4.4 —iptables=false"'
sudo sed -i "s/$infile/$tofile/g" /etc/default/docker
service docker restart

# Add these lines JUST BEFORE "*filter".
read -r -d '' newTxt << End
*nat
:POSTROUTING ACCEPT [0:0]
-A POSTROUTING ! -o docker0 -s 172.17.0.0/16 -j MASQUERADE
COMMIT
*filter

End

oldTxt="*filter"

sudo chown user:user /etc/ufw/before.rules
sudo python /home/user/server-scripts/utils/replace_word_in_file.py /etc/ufw/before.rules $oldTxt "$(printf "$newTxt")"
sudo chown root:root /etc/ufw/before.rules

#This is from a comment from the same source. Additional step for ubuntu 16.
sudo touch /etc/docker/daemon.json
sudo chown user:user /etc/docker/daemon.json
cat << End > /etc/docker/daemon.json

{
    "iptables": false
}

End
sudo chown root:root /etc/docker/daemon.json

