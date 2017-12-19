#!/bin/bash

# fixing the mount vboxsf issue
# sudo yum update -y
# sudo yum install -y kernel-$(uname -r) kernel-devel kernel-headers # or: reinstall
# rpm -qf /lib/modules/$(uname -r)/build
# ls -la /lib/modules/$(uname -r)/build
# sudo reboot # and re-login
# sudo ln -sv /usr/src/kernels/$(uname -r) /lib/modules/$(uname -r)/build
# sudo /opt/VBoxGuestAdditions-*/init/vboxadd setup


sudo rpm -Uvh /home/vagrant/workspace-pc/jdk-8u152-linux-x64.rpm
sudo alternatives --install /usr/bin/java java /usr/java/latest/bin/java 20000
sudo alternatives --install /usr/bin/javac javac /usr/java/latest/bin/javac 20000
sudo alternatives --install /usr/bin/jar jar /usr/java/latest/bin/jar 20000
sudo vi /etc/rc.local
export JAVA_HOME="/usr/java/latest"

#installing maven
sudo wget -P /usr/local  http://www-eu.apache.org/dist/maven/maven-3/3.5.2/binaries/apache-maven-3.5.2-bin.tar.gz
sudo tar xzf apache-maven-3.5.2-bin.tar.gz
sudo ln -s apache-maven-3.5.2  maven
source /etc/profile.d/maven.sh
sudo cp /tmp/maven.sh /etc/profile.d/maven.sh

#install Git
sudo yum install -y git

#installing jenkins
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
