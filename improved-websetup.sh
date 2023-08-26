#!/bin/bash

# Exit on error
set -e

# Function to display headers
show_header() {
    echo "############################"
    echo "$1"
    echo "############################"
    echo
}

# Function to install packages
install_packages() {
    sudo yum install wget unzip httpd -y
}

# Function to start and enable httpd service
start_httpd_service() {
    sudo systemctl start httpd
    sudo systemctl enable httpd
}

# Function to download and deploy website content
download_and_deploy_website() {
    show_header "Downloading HTML template"
    # Enter download url of template here
    sudo wget -P /tmp/webfile https://www.tooplate.com/zip-templates/2134_gotto_job.zip
    # Enter .zip name of file, overwrite file of same name
    unzip -o /tmp/webfile/2134_gotto_job.zip -d /tmp/webfile
    # Checks if filename exists or not in destination
    for file in /tmp/webfile/2134_gotto_job/*; do
        filename=$(basename "$file")
        if [ -f "/var/www/html/$filename" ]; then
            echo "Skipping $filename as it already exists in destination."
        else
            sudo mv "$file" /var/www/html/
        fi
    done
}

# Function to restart httpd service
restart_httpd_service() {
    show_header "Restarting httpd service"
    sudo systemctl restart httpd
}

# Main script

show_header "Installing dependencies"
install_packages

show_header "Creating temp folders"
mkdir -p /tmp/webfile
cd /tmp/webfile

start_httpd_service

download_and_deploy_website

restart_httpd_service

show_header "Checking httpd status and obtaining ip address"
sudo systemctl status httpd
echo "###########################"
ip addr
echo "###########################"
echo " "

# Clean up
show_header "Removing temp folder"
sudo rm -rf /tmp/webfile

echo "Script completed successfully!"
