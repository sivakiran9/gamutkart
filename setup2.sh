#!/bin/bash -x

DIR="/home/ubuntu/tom"
DIR2="/home/ubuntu/tom/apache-tomcat-8.5.71"
FILE="/home/ubuntu/tom/apache-tomcat-8.5.71/webapps/jenkins.war"

#sudo apt-get update

javac -version

if [ $? -eq 0 ]
then
  echo "-----jdk is already installed-----"
else
  echo "-----update and installing java-----"
  sudo apt-get update
  sudo apt-get install -y openjdk-8-jdk
  #echo "java is already installed"
fi

mvn -v

if [ $? -eq 0 ]
then
  echo "-----maven is already installed-----"
else
  echo "-----updating and installing the maven-----"
  sudo apt update
  sudo apt -y install maven
fi

if [ -d "$DIR" ]; then
  ### Take action if $DIR exists ###
  echo "----Already presrnt the directory ${DIR}----"
else
  ###  Control will jump here if $DIR does NOT exists ###
  echo "Error: ${DIR} not found. Can not continue."
  echo "=====creating directory====="
  mkdir /home/ubuntu/tom
fi
echo "---change the working directory path---"
cd /home/ubuntu/tom

#echo "------updating and Install the wget-------"
#sudo apt-get update
#sudo apt-get install -y wget
#echo "Download the Tomcat8"

if [ -d "$DIR2" ]; then
  ### Take action if $DIR exists ###
  echo "-----Tomcat is installed in this path ${DIR2}-----"
else
  ###  Control will jump here if $DIR does NOT exists ###
  echo "Error: ${DIR2} not found. Can not continue."
  echo "------Installing tomcat8-------"
  wget https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.71/bin/apache-tomcat-8.5.71.tar.gz
  echo "=====untar the tomcat file====="
  tar -zxvf apache-tomcat-8.5.71.tar.gz
fi

if [ -f "$FILE" ]; then
    echo "$FILE exists "
else 
  echo "$FILE does not exist."
  cd /home/ubuntu/tom/apache-tomcat-8.5.71/webapps/
  wget https://updates.jenkins-ci.org/download/war/2.313/jenkins.war
  echo "jenkins file is installing"
fi
