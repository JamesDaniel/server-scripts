sudo apt-get update
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo apt-add-repository 'deb https://apt.dockerproject.org/repo ubuntu-xenial main'
sudo apt-get update
apt-cache policy docker-engine
# todo maybe add a bash prompt 'Is this the right docker repo? continue?'
sudo apt-get install -y docker-engine
sudo usermod -aG docker user
sudo systemctl status docker
echo 'You will need to log out and back in to use docker without sudo.'
