#! /bin/sh

# build deps
apk add --no-cache python-dev musl-dev gcc g++ make py-pip libffi-dev openssl-dev tar autoconf automake

# runtime deps
apk add --no-cache python openssl unrar unzip p7zip

# Python deps
pip install Cheetah \
    pydbus \
    pyOpenSSL

# Yenc
mkdir -p /usr/share/yenc
wget -qO yenc.tar.gz https://bitbucket.org/dual75/yenc/get/0.4.0.tar.gz
tar -xvzf yenc.tar.gz --strip-components=1 --directory=/usr/share/yenc
rm yenc.tar.gz
cd /usr/share/yenc
python setup.py install
cd ~
rm -r yenc

# Par2cmdline
mkdir -p /usr/share/par2cmdline
wget -qO par2cmdline.tar.gz https://github.com/Parchive/par2cmdline/archive/v0.6.14.tar.gz
tar -xvzf par2cmdline.tar.gz --strip-components=1 --directory=/usr/share/par2cmdline
cd /usr/share/par2cmdline
aclocal && automake --add-missing && autoconf
./configure && make && make install
cd ~

# sabnzbd
mkdir -p /usr/share/sabnzbd
wget -qO src.tar.gz https://github.com/sabnzbd/sabnzbd/releases/download/1.0.0/SABnzbd-1.0.0-src.tar.gz
tar -xvzf src.tar.gz --strip-components=1 --directory /usr/share/sabnzbd
rm src.tar.gz 

# cleanup
apk del --purge python-dev musl-dev gcc g++ make py-pip libffi-dev openssl-dev tar autoconf automake
