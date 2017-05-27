mkdir ~/site
sudo apt-get install git
git clone https://github.com/JamesDaniel/portfolio-website.git ~/site/

docker build -t $(whoami)/site /home/$(whoami)/site
docker run --name docker-site -p 3001:8080 -d $(whoami)/site
