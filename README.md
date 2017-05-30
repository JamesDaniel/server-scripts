# Server Scripts

These scripts are to be used to automate the setup of an ubuntu 16 server on digitalocean.com. From start to finish it should take no longer than 15 minutes to run through this setup.

## Scripts

 - utils/
   - replace_word_in_file.py
     - This file will replace all substrings in a file with another substring.
 - init_server_as_root.sh
   - This file will setup a user on the server with sudo privileges. It will also setup the ssh key to be used by the user. The user name will be 'user'. Droplet monitoring will also be setup.
 - init_server_as_user.sh
   - This file will setup git and install python.
 - install_docker.sh
   - This file will install docker and allow the user 'user' to use docker without the command sudo. The user will first hace to log out and back in.
 - start_firewall_one.sh
   - This file will enable the ufw (uncomplicated firewall). Rules will be added to allow traffic for SSH and port 80. Additional steps are also taken so that the firewall will work with docker.
 - start_firewall_two.sh
   - This file will take the final steps to setting up the ufw firewall with docker. It will restart the server.
 - start_nginx_container.sh
   - This file will start a docker container and run nginx on port 80. A configuration file will setup a reverse proxy to redirect traffic from port 80 with no subdomain to port 3001.
 - start_nodejs_container.sh
   - This file is for testing purposes. After running this file a basic nodejs application should be accessible on port 3001.
 - start_site_container.sh
   - This will clone a nodejs project 'github.com/JamesDaniel/portfolio-website' and start it up on port 3001.

## Setup Instructions

To setup an ubuntu 16 instance on digitalocean.com follow these step by step instructions.

 - Create an ubuntu 16 droplet with a ssh key.
 - Reset the root password.
 - Open the web console and reset the master password.
 - Open putty or a terminal and ssh into the ubuntu instance as root. Enter the password obtained by resetting, and create a new root password.
 - SSH into the ubuntu instance as user 'root'.
 - clone this repository: `git clone https://github.com/JamesDaniel/server-scripts.git`
 - cd into the repo: `cd server-scripts/`
 - Execute the root initialization script: `./init_server_as_root.sh`
 - Log out and back in again as user 'user'.
 - Execute the user initialization script: `./init_server_as_user.sh`
 - Install Docker: `./install_docker.sh`
 - Startup the firewall: `sudo ./start_firewall_one.sh`
 - Finish setting up the firewall: sudo `./start_firewall_two.sh`
 - Startup nginx: `./start_nginx_container.sh`
 - Start up my website: `./start_site_container.sh`
