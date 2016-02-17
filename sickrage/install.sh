#!/bin/sh

# build deps
apk add --no-cache python-dev musl-dev libffi-dev gcc py-pip openssl-dev 

# runtime deps
apk add --no-cache python openssl git unrar

# python deps
pip install Cheetah pyopenssl

# sickrage
git clone https://github.com/SickRage/SickRage.git /usr/share/sickrage

# cleanup
apk del --purge python-dev musl-dev libffi-dev gcc py-pip openssl-dev 
