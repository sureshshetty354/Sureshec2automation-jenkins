#!/bin/bash

# Update server
yum update -y

# Install Java 21 (required for Jenkins)
yum install java-21-amazon-corretto -y

# Install Git
yum install git -y

# Install Maven
yum install maven -y

# Install Docker
yum install docker -y

systemctl start docker
systemctl enable docker

# Install Apache HTTP Server
yum install httpd -y

systemctl start httpd
systemctl enable httpd

# Jenkins Installation
wget -O /etc/yum.repos.d/jenkins.repo \
https://pkg.jenkins.io/redhat-stable/jenkins.repo

rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

yum install jenkins -y

systemctl start jenkins
systemctl enable jenkins

# Give Jenkins permission to use Docker
usermod -aG docker jenkins

systemctl restart jenkins

echo "Jenkins, Docker, Maven, Git and Apache installation completed"

# Verify installations
java -version
git --version
mvn -version
docker --version
httpd -v
jenkins --version
