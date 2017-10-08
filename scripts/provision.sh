#!/bin/sh

# - Defaults
DEFAULT_GIT_USERNAME="roygarnaat-cap"
DEFAULT_GIT_PASSWORD="admin1234"

# - Prompt for Git user
GIT_USERNAME=
while [ -z $GIT_USERNAME ]
do
    echo 'Type in Git username. Hit return for default value:' $DEFAULT_GIT_USERNAME
    read GIT_USERNAME
    GIT_USERNAME=${GIT_USERNAME:=$DEFAULT_GIT_USERNAME}
done

# - Prompt for Git pwd
GIT_PASSWORD=
while [ -z $GIT_PASSWORD ]
do
    echo 'Type in Git password. Hit return for default value:' $DEFAULT_GIT_PASSWORD
    read -s GIT_PASSWORD
    GIT_PASSWORD=${GIT_PASSWORD:=$DEFAULT_GIT_PASSWORD}
done

# - RHEL:
#sudo yum install -y gcc-c++ make
#curl -sL https://rpm.nodesource.com/setup_8.x | sudo -E bash -
#sudo yum install java-1.7.0-openjdk-devel -y
#sudo yum install git -y
#sudo yum install nodejs -y

# - Ubuntu:
sudo apt-get update
sudo apt-get install default-jre -y
sudo apt-get install default-jdk -y
sudo update-alternatives --config java

# - Install Git -
sudo apt-get install git -y

# - Install Apache -
sudo apt-get update
sudo apt-get install apache2 -y

# - Install NodeJS -
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install nodejs -y
sudo apt-get install nodejs-legacy -y
sudo apt-get install npm -y

# - Install Polymer CLI -
sudo npm i polymer-cli -g

# - Install Bower -
sudo npm i bower -g

# - Clone WSO2 auth api -
cd /vagrant/projects
sudo git clone https://$GIT_USERNAME:$GIT_PASSWORD@github.com/roygarnaat/nn-bancassurance-nodejs-proxy
cd /vagrant/projects/nn-bancassurance-nodejs-proxy

# - Run WSO2 auth api server in background -
sudo chmod -R 777 ./
sudo npm i
#nohup node api-proxy.js 2>&1 &

# - Clone frontend app -
cd /vagrant/projects
sudo git clone https://$GIT_USERNAME:$GIT_PASSWORD@github.com/roygarnaat/nn-bancassurance

# - Make it accessible -
sudo chmod -R 777 /vagrant/projects/nn-bancassurance
sudo rm -rf /var/www/html
### sudo mv -v /nn-bancassurance/html/* /var/www/html
sudo ln -s /vagrant/projects/nn-bancassurance/html /var/www
cd /var/www/html
bower install --force-latest --allow-root

# - Clone WSO2 Repository -
cd /vagrant/projects
sudo git clone https://$GIT_USERNAME:$GIT_PASSWORD@github.com/roygarnaat/nn-bancassurance-wso2am
sudo chmod -R 777 /vagrant/projects/nn-bancassurance-wso2am

# - Run WSO2 ApiManager
#cd /vagrant/projects/nn-bancassurance-wso2am/wso2am-2.1.0/bin
#export JAVA_HOME=/usr; sh wso2server.sh