sudo adduser user
sudo adduser user sudo
sudo gpasswd -a user sudo
mkdir /home/user/.ssh
chown user:user /home/user/.ssh
cp ~/.ssh/authorized_keys /home/user/.ssh/authorized_keys
chown user:user /home/user/.ssh/authorized_keys
su user
git clone https://github.com/JamesDaniel/server-scripts.git ~/server-scripts
git config --global user.name "JamesDaniel"
git config --global user.email "james.d.mcgarr@students.ittralee.ie"
sudo apt-get install python
# Suggested next scripts to run.
#/home/user/server-scripts/install_docker.sh
#/home/user/server-scripts/start_firewall.sh
