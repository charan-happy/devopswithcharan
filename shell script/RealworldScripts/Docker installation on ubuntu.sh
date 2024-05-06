#!/bin/bash
# Update package index and install required dependencies
sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl software-propertiescommon
# Add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o 
/usr/share/keyrings/docker-archive-keyring.gpg
# Add Docker repository
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/dockerarchive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs)
stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
# Install Docker
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io
# Add the current user to the 'docker' group to run Docker commands without 'sudo'
sudo usermod -aG docker $USER
# Start and enable Docker service
sudo systemctl start docker
sudo systemctl enable docker
# Print Docker version
docker --version
