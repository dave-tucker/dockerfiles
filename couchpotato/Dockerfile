FROM alpine:latest

COPY install.sh install.sh
RUN sh install.sh
 
EXPOSE 5050
VOLUME /root
VOLUME /mnt/media

CMD [ "python", "/usr/share/couchpotato/CouchPotato.py", "--debug", "--console_log", "--config_file=/root/config.ini", "--data_dir=/root/data" ]	
