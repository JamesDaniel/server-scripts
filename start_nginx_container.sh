# This file will run a container called docker-nginx so make sure a container with this name doesn't already exist.
# This container will use port 80 so make sure that port if free.

docker pull nginx
docker ps -a
mkdir -p ~/docker-nginx/html
touch ~/docker-nginx/html/index.html
echo '<html> <head> <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet" integrity="sha256-MfvZlkHCEqatNoGiOXveE8FIwMzZg4W85qfrfIFBfYc=sha512-dTfge/zgoMYpP7QbHy4gWMEGsbsdZeCXz7irItjcC3sPUFtf0kuFbDz/ixG7ArTxmDjLXDmezHubeNikyKGVyQ==" crossorigin="anonymous"> <title>Docker nginx Tutorial</title> </head> <body> <div class="container"> <h1>Hello Digital Ocean</h1> <p>This nginx page is brought to you by Docker and Digital Ocean</p></div></body></html>' > ~/docker-nginx/html/index.html
docker run --name docker-nginx -p 80:80 -d -v ~/docker-nginx/html:/usr/share/nginx/html nginx
docker cp docker-nginx:/etc/nginx/conf.d/default.conf ~/docker-nginx/default.conf
docker stop docker-nginx
docker rm docker-nginx
docker run --name docker-nginx -p 80:80 -v ~/docker-nginx/html:/usr/share/nginx/html -v ~/docker-nginx/default.conf:/etc/nginx/conf.d/default.conf -d nginx
sudo apt-get install htpasswd
echo 'Enter password for user in htpasswd:'
sudo htpasswd -c ~/docker-nginx/.htpasswd user
docker cp ~/docker-nginx/.htpasswd docker-nginx:/etc/nginx/conf.d/

# Final steps have to be manual as follows:
## Final steps are manual because the config code does not append correctly and causes the container to crash.

# append the following to the configuration file ~/docker-nginx/default.conf
#: '
echo 'Enter ip address of server'
read ipaddress

cat > ~/docker-nginx/default.conf <<- End

server {
        listen 80;
        listen [::]:80;

        server_name $ipaddress;

        root /var/www/example.com;
        index index.html;

        location / {
                proxy_pass http://$ipaddress:8080;
                auth_basic "Restricted";
                auth_basic_user_file /etc/nginx/conf.d/.htpasswd;
        }
}

End
#'

# Restart container with changes made to default.conf
docker restart docker-nginx
