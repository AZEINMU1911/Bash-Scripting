#!/bin/bash

# Installation for multiple OS

# Install dependencies
echo "#####################################################"
echo "Installing packages"
sudo yum --help &> /dev/null
if [ $? -eq 0 ]
then
	# Installation on RHEL Linux system
	echo "Running setup on RHEL Linux system"
	PACKAGE="httpd wget unzip"
	SVC="httpd"
	URL='https://www.tooplate.com/zip-templates/2137_barista_cafe.zip'
	ART_NAME="2137_barista_cafe"
	TEMPDIR='/tmp/webfiles/'
	sudo yum install $PACKAGE -y &> /dev/null
	echo ""

	# Starting httpd service
	echo "#############################################"
	echo "Starting httpd service"
	sudo systemctl start $SVC
	sudo systemctl enable $SVCd
	sudo systemctl status $SVC
	echo "#############################################"
	echo ""
	
	# Creating artifact directory
	echo "#############################################"
	echo "Starting artifact deployment"
	sudo mkdir -p $TEMPDIR
	cd $TEMPDIR
	echo "You are in: "
	pwd
	echo "#############################################"
	echo ""

	# Getting web template
	sudo wget $URL
	sudo unzip "$ART_NAME".zip
	sudo cp -r $ART_NAME/* /var/www/html/
	echo ""

	# Bounce service
	echo "#############################################"
	echo "Restarting service"
	sudo systemctl restart $SVC
	sudo systemctl status $SVC
	echo "#############################################"
	echo ""
	# Clean up
	echo "#############################################"
	echo "Cleaning up temp directory"
	sudo rm -rf $TEMPDIR

else
	# Installation on UBUNTU Linux system
	echo "Running setup on UBUNTU Linux system"
	PACKAGE="apache2 wget unzip"
	SVC="apache2"
	URL='https://www.tooplate.com/zip-templates/2098_health.zip'
	ART_NAME="2098_health"
	TEMPDIR='/tmp/webfiles/'
	sudo apt update
	sudo apt install $PACKAGE -y &> /dev/null
	echo ""

	# Starting apache2 service
	echo "#############################################"
	echo "Starting apache2 service"
	sudo systemctl start $SVC
	sudo systemctl enable $SVCd
	sudo systemctl status $SVC
	echo "#############################################"
	echo ""
	
	# Creating artifact directory
	echo "#############################################"
	echo "Starting artifact deployment"
	sudo mkdir -p $TEMPDIR
	cd $TEMPDIR
	echo "You are in: "
	pwd
	echo "#############################################"
	echo ""

	# Getting web template
	sudo wget $URL
	sudo unzip "$ART_NAME".zip
	sudo cp -r $ART_NAME/* /var/www/html/
	echo ""

	# Bounce service
	echo "#############################################"
	echo "Restarting service"
	sudo systemctl restart $SVC
	sudo systemctl status $SVC
	echo "#############################################"
	echo ""

	# Clean up
	echo "#############################################"
	echo "Cleaning up temp directory"
	sudo rm -rf $TEMPDIR
	# End esle if statement
fi
