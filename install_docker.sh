#!/usr/bin/env bash

# Install required packages
sudo apt update
sudo apt-get install -y --install-recommends \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# Install docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"

sudo apt-get -y update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# sudo usermod -aG docker $USER
sudo usermod -aG docker ubuntu


sudo systemctl daemon-reload
sudo systemctl restart docker


# Download and install docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose


# install other dependencies

sudo apt-get install -y zip


