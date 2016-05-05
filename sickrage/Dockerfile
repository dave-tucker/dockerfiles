FROM alpine:latest

COPY install.sh install.sh
RUN sh install.sh

EXPOSE 8081
VOLUME /root
VOLUME /mnt/media

ENTRYPOINT ["python", "/usr/share/sickrage/SickBeard.py", "--datadir=/root" ]

