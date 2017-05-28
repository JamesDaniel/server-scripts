sudo adduser user
sudo adduser user sudo
sudo gpasswd -a user sudo
mkdir /home/user/.ssh
chown user:user /home/user/.ssh
cp ~/.ssh/authorized_keys /home/user/.ssh/authorized_keys
chown user:user /home/user/.ssh/authorized_keys

#Suggested next script:
# init_server_as_user.sh
