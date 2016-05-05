#!/bin/sh

# build deps
apk add --no-cache python-dev musl-dev gcc g++ make py-pip libffi-dev openssl-dev tar autoconf automake

# run deps
apk add --no-cache git python openssl py-lxml

pip install pyopenssl

git clone https://github.com/CouchPotato/CouchPotatoServer.git /usr/share/couchpotato

apk del --purge python-dev musl-dev gcc g++ make py-pip libffi-dev openssl-dev tar autoconf automake

