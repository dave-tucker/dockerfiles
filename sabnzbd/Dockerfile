FROM alpine:latest

# install
COPY install.sh install.sh
RUN sh install.sh

WORKDIR /root
EXPOSE 8080
VOLUME /root
VOLUME /mnt/media

ENTRYPOINT ["python", "/usr/share/sabnzbd/SABnzbd.py", "-s", "0.0.0.0:8080"]
