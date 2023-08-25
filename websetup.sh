##### This is script is for setting up webpage #####
#!/bin/bash
   
## Install dependencies ##
echo "############################"
echo "Installing dependencies"
echo "############################"
sudo yum install wget unzip httpd -y
echo " "
  
## Creating new folder and changing present working directory ##
echo "############################"
echo "Creating temp folders"
echo "############################"
echo " "
mkdir -p /tmp/webfile
cd /tmp/webfile 
## Starting httpd service ##
echo "###########################"
echo "Starting httpd service"
echo "###########################"
echo " "
sudo systemctl start httpd
sudp systemctl enable httpd
 
## Downloading HTML template, unzip an pwd and moving content to website dir ##
echo "############################"
echo "Downloading HTML template"
echo "############################"
echo " "
sudo wget https://www.tooplate.com/zip-templates/2134_gotto_job.zip
unzip 2134_gotto_job.zip
sudo cp -r 2134_gotto_job.zip/* var/www/html
 
## Restarting httpd ##
echo "############################"
echo "Restarting httpd service"
echo "############################"
echo " "
sudo systemctl restart httpd
 
## Remove temporary folders ##
echo "###########################"
echo "Removing temp folder"
echo "###########################"
ßsudo rm -rf /tmp/webfile
