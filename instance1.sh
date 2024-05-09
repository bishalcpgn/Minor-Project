#!/bin/bash
sudo apt update && apt upgrade -y
sudo apt install fontconfig openjdk-17-jre -y 

sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins

#Installing docker
sudo apt install docker.io -y
sudo usermod -aG docker ubuntu
newgrp docker
sudo chown ubuntu:docker /var/run/docker.socket
sudo systemctl status docker 
sudo systemctl start docker 
sudo systemctl enable docker

#Adding sonarcube
docker run -d --name sonar -p 9000:9000 sonarqube:lts-community
docker ps 
