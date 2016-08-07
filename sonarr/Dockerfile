FROM alpine:3.4
MAINTAINER Dave Tucker <dave@dtucker.co.uk>

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk add --no-cache ca-certificates openssl mono sqlite libmediainfo

RUN wget -qO NzbDrone.tar.gz http://update.sonarr.tv/v2/master/mono/NzbDrone.master.tar.gz &&\
	tar -xzf NzbDrone.tar.gz &&\
	rm NzbDrone.tar.gz

CMD ["mono", "/NzbDrone/NzbDrone.exe"]

EXPOSE 8989
EXPOSE 9898
VOLUME /root/.config/NzbDrone
