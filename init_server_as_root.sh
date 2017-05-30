# Create new user with sudo priviledges.
sudo adduser user
sudo adduser user sudo
sudo gpasswd -a user sudo

# Setup ssh key
mkdir /home/user/.ssh
chown user:user /home/user/.ssh
cp ~/.ssh/authorized_keys /home/user/.ssh/authorized_keys
chown user:user /home/user/.ssh/authorized_keys

# Update droplet monitoring
curl -sSL https://agent.digitalocean.com/install.sh | sh
