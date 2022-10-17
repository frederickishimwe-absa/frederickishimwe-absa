#!/bin/bash

# Bash "strict mode", to help catch problems and bugs in the shell
# script. Every bash script you write should include this. See
# http://redsymbol.net/articles/unofficial-bash-strict-mode/ for
# details.
set -euo pipefail

# Tell apt-get we're never going to be able to give manual
# feedback:
export DEBIAN_FRONTEND=noninteractive

# Update the package listing, so we know what package exist:
apt-get update

# Install security updates:
# apt-get -y upgrade
 
# Install a new package, without unnecessary recommended packages:
apt-get -y install --no-install-recommends \
  tzdata  nano vim curl xvfb wget  libx11-dev   fonts-liberation   xdg-utils   libnss3   libxss1 zip unzip gcc make libpcre3-dev   zlib1g-dev gnupg \
  libgtk-3-0 libatk-bridge2.0-0 libatk1.0-0 libatspi2.0-0 libcairo2 libcups2 libgbm1 libgdk-pixbuf2.0-0 libpango-1.0-0  python3-pip python3-dev 

wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - 
echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list 
apt-get update -qqy 
apt-get -qqy install ${CHROME_VERSION} 
rm /etc/apt/sources.list.d/google-chrome.list 
rm -rf /var/lib/apt/lists/* /var/cache/apt/*

# $CHROME_DRIVER_VERSION
  if [ -z "$CHROME_DRIVER_VERSION" ]; 
    then CHROME_MAJOR_VERSION=$(google-chrome --version | sed -E "s/.* ([0-9]+)(\.[0-9]+){3}.*/\1/") 
    CHROME_DRIVER_VERSION=$(wget --no-verbose -O - "https://chromedriver.storage.googleapis.com/LATEST_RELEASE_${CHROME_MAJOR_VERSION}"); 
  fi

  echo "Using chromedriver version: "$CHROME_DRIVER_VERSION 
  wget --no-verbose -O /tmp/chromedriver_linux64.zip https://chromedriver.storage.googleapis.com/$CHROME_DRIVER_VERSION/chromedriver_linux64.zip 
  rm -rf /opt/selenium/chromedriver 
  unzip /tmp/chromedriver_linux64.zip -d /opt/selenium 
  rm /tmp/chromedriver_linux64.zip 
  mv /opt/selenium/chromedriver /opt/selenium/chromedriver-$CHROME_DRIVER_VERSION 
  chmod 755 /opt/selenium/chromedriver-$CHROME_DRIVER_VERSION 
  ln -fs /opt/selenium/chromedriver-$CHROME_DRIVER_VERSION /usr/bin/chromedriver

#Install python to run selenium to test the Ui with robotframework and flask
pip3 install --no-cache-dir -r selenium_python_req 

cd /usr/local/bin && ln -s /usr/bin/python3 python


# Delete cached files we don't need anymore (note that if you're
# using official Docker images for Debian or Ubuntu, this happens
# automatically, you don't need to do it yourself):
apt-get clean
# Delete index files we don't need anymore:
rm -rf /var/lib/apt/lists/*  /var/cache/apt/*