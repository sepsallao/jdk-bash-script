#!/usr/bin/env bash

# J Class - OpenJDK Automation for Compiling
# Bash Script ver 0.1
# Created by Joseph Christofer Sallao jr.

echo "Version 0.1"

apt-get -y update

# Download JDK 19 from oracle
# wget https://download.oracle.com/java/19/latest/jdk-19_linux-x64_bin.deb
wget https://download.oracle.com/java/20/latest/jdk-20_linux-x64_bin.deb

# Install JDK 20 with Deb file
# apt-get -y install ./jdk-19_linux-x64_bin.deb
sudo apt-get -y install ./jdk-19_linux-x64_bin.deb

# Setup Java
sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk-20/bin/java 1
sudo update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/jdk-20/bin/javac 1
sudo update-alternatives --install /usr/bin/jar jar /usr/lib/jvm/jdk-20/bin/jar 1
sudo update-alternatives --config java
sudo update-alternatives --config javac
sudo update-alternatives --config jar

# Check version of Java
java --version
javac --version

# Link jdk-19 to $JAVA_HOME
sudo export JAVA_HOME=/usr/lib/jvm/jdk-20

# Setting up the JDK's Script
sudo cat jdk.sh > /etc/profile.d/jdk.sh
sudo chmod +x /etc/profile.d/jdk.sh

# Calling and printing the path of $JAVA_HOME
echo $JAVA_HOME

# Installing dependencies of the source code
echo "Install dependencies:"
apt-get install -y autoconf gcc make build-essential zip unzip libx11-dev libxext-dev libxrender-dev libxtst-dev libcups2-dev libfontconfig1-dev libasound2-dev ccache

# Installing other dependencies that the host might need
echo "Installing additional might need by the host:"
apt-get install -y libx11-dev libxext-dev libxrender-dev libxrandr-dev libxtst-dev libxt-dev

# Cloning the source code 
echo "Starting to clone from OpenJDK repository:"
git clone https://github.com/openjdk/jdk.git

# To pull for building a certain version of jdk's source code:
#```bash
# $ git checkout tags/jdk-19+36
#```
git checkout tags/jdk-20+34

# Running configure to buildf
cd jdk/f

echo "our location:"
pwd

sudo bash configure --build=x86_64-unknown-linux-gnu --host=x86_64-unknown-linux-gnu

# Running make file to compile
cd jdk/

echo "our location:"
pwd

sudo make images

# Checking the version of the compiled
echo "our location:"
pwd

./build/linux-x86_64-server-release/images/jdk/bin/java --version
