sudo adduser user sudo
sudo gpasswd -a user sudo
chown user:user init_server.sh
mv init_server.sh /home/user/init_server.sh
su user
sudo apt-get install git
git config --global user.name "JamesDaniel"
git config --global user.email "james.d.mcgarr@students.ittralee.ie"
git clone https://github.com/JamesDaniel/server-scripts.git /home/user/server-scripts
/home/user/server-scripts/start_firewall.sh
