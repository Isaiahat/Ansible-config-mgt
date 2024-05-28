#!/bin/bash

# Installing Dependencies
echo "########################################"
echo "Installing packages."
echo "########################################"
sudo yum update -y > /dev/null
sudo yum install wget unzip httpd -y > /dev/null
echo

# Creating Temp Directory
echo "########################################"
echo "Starting Artifact Deployment"
echo "########################################"
mkdir -p /tmp/webfiles
cd /tmp/webfiles
echo

wget https://www.tooplate.com/zip-templates/2137_barista_cafe.zip > /dev/null
unzip 2137_barista_cafe.zip > /dev/null
sudo cp -r 2137_barista_cafe/* /var/www/html/
echo

# Bounce Service
echo "########################################"
echo "Restarting Apache Webserver service"
echo "########################################"
sudo systemctl start httpd
sudo systemctl enable httpd
sudo systemctl restart httpd
echo

# Clean Up
echo "########################################"
echo "Removing Temporary Files"
echo "########################################"
sudo rm -rf /tmp/webfiles
echo "job done"