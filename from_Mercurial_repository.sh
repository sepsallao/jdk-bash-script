#!/bin/bash

# Install necessary software
sudo dnf install java-1.8.0-openjdk-devel zip unzip gcc-c++ make autoconf libtool java-1.8.0-openjdk-headless java-1.8.0-openjdk-devel pkgconfig xorg-x11-proto-devel cups-devel freetype-devel giflib-devel libjpeg-devel libpng-devel libtiff-devel libX11-devel libXext-devel libXrender-devel libXtst-devel alsa-lib-devel fontconfig-devel krb5-devel libXi-devel libXinerama-devel libXrandr-devel libXcursor-devel libXfixes-devel libXft-devel libXft-devel libXmu-devel libXpm-devel libXrender-devel libXt-devel libXtst-devel zlib-devel

# Set environment variables
export ALT_BOOTDIR=/usr/lib/jvm/java-1.8.0-openjdk
export ALT_JDK_IMPORT_PATH=$ALT_BOOTDIR
export LANG=C

# Download OpenJDK source code
hg clone http://hg.openjdk.java.net/jdk-updates/jdk19u/

# Navigate to OpenJDK source code directory
cd jdk19u

# Configure the build
bash configure --with-boot-jdk=$ALT_BOOTDIR --with-jvm-variants=server

# Build the JDK
make images

# Run tests
make test

# Install the JDK
make install

# Create tar archive of installed JDK
tar -czf jdk.tar.gz install/
