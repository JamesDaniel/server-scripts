##sudo ufw enable
##sudo ufw allow ssh
##sudo ufw allow 80

# source: https://svenv.nl/unixandlinux/dockerufw
##echo 'Setting default forward policy to: DEFAULT_FORWARD_POLICY="ACCEPT"'
##infile='DEFAULT_FORWARD_POLICY="DROP"'
##tofile='DEFAULT_FORWARD_POLICY="ACCEPT"'
##sudo sed -i "s/$infile/$tofile/g" /etc/default/ufw
##sudo ufw reload

##echo 'Setting docker opts to: DOCKER_OPTS="--dns 8.8.8.8 --dns 8.8.4.4 —iptables=false"'
##infile='#DOCKER_OPTS="--dns 8.8.8.8 --dns 8.8.4.4"'
##tofile='DOCKER_OPTS="--dns 8.8.8.8 --dns 8.8.4.4 —iptables=false"'
##sudo sed -i "s/$infile/$tofile/g" /etc/default/docker
##service docker restart

infile='*filter'
# Add these lines JUST BEFORE "*filter".

newline=$'\n'
l1="*nat"
l2=":POSTROUTING ACCEPT [0:0]"
l3="-A POSTROUTING ! -o docker0 -s 172.17.0.0/16 -j MASQUERADE"
l4="COMMIT"
L5=$infile

linenum=$(sudo awk '/filter/{ print NR; exit }' /etc/ufw/before.rules)
sudo sed '12i\
*nat' /etc/ufw/before.rules > /etc/ufw/before.rules
#linenum=$(($linenum+1))
tofile="sexy as hell *filter"
#read -r -d '' tofile << End
#
#*nat
#:POSTROUTING ACCEPT [0:0]
#-A POSTROUTING ! -o docker0 -s 172.17.0.0/16 -j MASQUERADE
#COMMIT
#*filter
#End

#sudo sed -i "s/$infile/$tofile/g" /etc/ufw/before.rules
##sudo nano /etc/ufw/before.rules

#Manual step. Don't know why this line is getting a permission denied.
#sudo touch /etc/docker/daemon.json
#sudo echo ' { "iptables": false } ' > /etc/docker/daemon.json

##sudo service docker stop
##sudo service docker start
##sudo reboot now

##sudo ufw enable
##sudo ufw allow 80

