#!/bin/sh

# runtime deps
apk add --no-cache python py-openssl git unrar

# sickrage
git clone https://github.com/SickRage/SickRage.git /usr/share/sickrage

