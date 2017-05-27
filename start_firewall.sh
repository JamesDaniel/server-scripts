sudo ufw enable

# source: https://svenv.nl/unixandlinux/dockerufw
sudo nano /etc/default/ufw
echo 'Set default forward policy like this DEFAULT_FORWARD_POLICY="ACCEPT"'
sudo ufw reload
sudo nano /etc/default/docker
echo 'Set docker opts to DOCKER_OPTS="--dns 8.8.8.8 --dns 8.8.4.4 —iptables=false"'
service docker restart

# Add these lines JUST BEFORE "*filter".
#*nat
#:POSTROUTING ACCEPT [0:0]
#-A POSTROUTING ! -o docker0 -s 172.17.0.0/16 -j MASQUERADE
#COMMIT
sudo nano /etc/ufw/before.rules

#Manual step. Don't know why this line is getting a permission denied.
#sudo touch /etc/docker/daemon.json
#sudo echo ' { "iptables": false } ' > /etc/docker/daemon.json

sudo service docker stop
sudo service docker start
sudo reboot now

sudo ufw enable
sudo ufw allow 80

