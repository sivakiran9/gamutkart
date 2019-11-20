#!/bin/bash

echo updating
apt-get update
apt-get install -y git
echo ssh server is installing
apt-get install -y openssh-server
echo installing the wget command
apt-get install -y wget
echo git installing is done
apt-get install -y sudo

useradd -m -d /home/satya -s /bin/bash satya
echo "satya:satya" | chpasswd
sed -i '21i satya    ALL=(ALL:ALL) ALL' /etc/sudoers

cd /home/satya

mkdir distros
chmod -R 777 distros
cd distros

echo download the java
wget jdk-8uversion-linux-x64.tar.gz
tar -zxvf jdk-8uversion-linux-x64.tar.gz

echo Download the java
wget https://download.oracle.com/otn/java/jdk/8u231-b11/5b13a193868b4bf28bcb45c792fce896/jdk-8u231-linux-x64.tar.gz
tar -zxvf jdk-8u231-linux-x64.tar.gz

echo Download jdk

wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u141-b15/336fa29ff2bb4ef291e347e091f7f4a7/jdk-8u141-linux-x64.tar.gz
tar zxpvf jdk-8u141-linux-x64.tar.gz

echo Download the maven
 
wget http://mirrors.estointernet.in/apache/maven/maven-3/3.6.2/binaries/apache-maven-3.6.2-bin.tar.gz

echo extract the file

tar -zxvf apache-maven-3.6.2-bin.tar.gz

echo Download the Tomcat8

wget http://apachemirror.wuchna.com/tomcat/tomcat-8/v8.5.47/bin/apache-tomcat-8.5.47.tar.gz

echo extract the file

tar -zxvf apache-tomcat-8.5.47.tar.gz

echo setup the environment variables

echo 'export JAVA_HOME=/home/satya/distros/jdk1.8.0_141
      export CATALINA_HOME=/home/satya/distros/apache-tomcat-8.5.47
      export M2_HOME=/home/satya/distros/apache-maven-3.6.2
      export PATH=$JAVA_HOME/bin:$CATALINA_HOME/bin:$M2_HOME/bin:$PATH' >> /root/.bashrc

cd 

source .bashrc

echo source .bashrc is done

echo Download the jenkins war file 

cd /home/satya/distros/apache-tomcat-8.5.47/webapps

wget https://updates.jenkins-ci.org/download/war/2.156/jenkins.war

