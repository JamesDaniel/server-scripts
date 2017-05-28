# Final steps setting up firewall. Due to asynchronous behavious, the commands
# for configuring the firewall needed to be divided into two scripts
# which should be manually executed.
sudo service docker stop
sudo service docker start
sudo reboot now

