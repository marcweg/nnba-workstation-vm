# NNBA

This repository holds the code for creating and running a Virtual Machine containing all required repositories concerning the NNBA project. 
This VM provides developers with an uniform development workstation. 

# Stack and Tooling

- Amazon AWS
- Gitlab
- Oracle VM Virtualbox (https://www.virtualbox.org)
- Hashicorp Vagrant (https://www.vagrantup.com)
- Ubuntu 16.04 for Vagrant (https://app.vagrantup.com/box-cutter/boxes/ubuntu1604-desktop)
- Hashicorp Terraform AWS provider (https://www.terraform.io/docs/providers/aws)
- WSO2 API Manager 2.10 (https://docs.wso2.com/display/AM210)
- Eclipse Oxygen (https://www.eclipse.org/downloads/)
- WSO2 plugin for Eclipse(https://wso2.com/products/developer-studio/)
- Polymer CLI 2.0 (https://www.polymer-project.org/2.0/start/) 

## Installation

1 ) Download Vagrant for your OS from https://www.vagrantup.com/downloads.html

2 ) Clone the workstation repository

    git clone https://github.com/roygarnaat/nnba-workstation-vm

## Running

1 ) Run the vagrant up command to create and provision the VM

    cd nnba-workstation-vm
    vagrant up

2 ) SSH into the newly create VM and start all servers

    vagrant ssh
    cd /vagrant/scripts
    sh start-all.sh