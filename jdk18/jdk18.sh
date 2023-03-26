#!/usr/bin/env bash

# J Class - OpenJDK Automation for Compiling
# JDK 18 Bash Script ver 1.0.18
# Created by Joseph Christofer Sallao jr.

echo "Version 1.0.18"

apt-get -y update

# Download JDK 18
wget https://download.oracle.com/java/18/archive/jdk-18.0.2.1_linux-x64_bin.deb


# Install JDK 18
sudo apt-get -y install ./jdk-18.0.2.1_linux-x64_bin.deb

# Setup Java
sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk-18/bin/java 1
sudo update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/jdk-18/bin/javac 1
sudo update-alternatives --install /usr/bin/jar jar /usr/lib/jvm/jdk-18/bin/jar 1
sudo update-alternatives --config java
sudo update-alternatives --config javac
sudo update-alternatives --config jar

# Check version of Java
java --version
javac --version

# Link jdk-18 to $JAVA_HOME 
# export JAVA_HOME=/usr/lib/jvm/jdk-18

# Setting up the JDK's Script
sudo cat jdk.sh > /etc/profile.d/jdk.sh
sudo chmod +x /etc/profile.d/jdk.sh

# Calling and printing the path of $JAVA_HOME
# echo $JAVA_HOME

# Installing dependencies of the source code
echo "Install dependencies:"
apt-get install -y autoconf gcc make build-essential zip unzip libx11-dev libxext-dev libxrender-dev libxtst-dev libcups2-dev libfontconfig1-dev libasound2-dev ccache

# Installing other dependencies that the host might need
echo "Installing additional might need by the host:"
apt-get install -y libx11-dev libxext-dev libxrender-dev libxrandr-dev libxtst-dev libxt-dev
