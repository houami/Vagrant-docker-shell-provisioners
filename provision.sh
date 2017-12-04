#!/bin/bash
sudo rpm -Uvh /home/vagrant/workspace-pc/jdk-8u151-linux-x64.rpm
sudo alternatives --install /usr/bin/java java /usr/java/latest/bin/java 20000
sudo alternatives --install /usr/bin/javac javac /usr/java/latest/bin/javac 20000
sudo alternatives --install /usr/bin/jar jar /usr/java/latest/bin/jar 20000
sudo vi /etc/rc.local
export JAVA_HOME="/usr/java/latest"
sudo yum install -y wget
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo
sudo rpm --import http://pkg.jenkins-ci.org/redhat-stable/jenkins-ci.org.key
sudo yum install -y jenkins-2.73.3-1.1
sudo yum-config-manager --disable jenkins
sudo yum install -y net-tools
sudo systemctl start jenkins
systemctl enable jenkins
sudo systemctl enable jenkins
sudo systemctl status jenkins

#install ansible
sudo yum install -y epel-release
sudo yum install -y ansible

#install docker
sudo yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2

sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

sudo yum-config-manager --enable docker-ce-edge

sudo yum install -y docker-ce

#docker without sudo
sudo systemctl start docker
sudo groupadd docker
sudo gpasswd -a $USER docker
