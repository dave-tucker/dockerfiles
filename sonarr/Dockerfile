FROM alpine:3.4
MAINTAINER Dave Tucker <dave@dtucker.co.uk>

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk add --no-cache ca-certificates openssl mono sqlite

# Should package this for alpine
RUN apk add --no-cache git build-base &&\ 
	wget -qO mediainfo.tar.xz https://mediaarea.net/download/binary/libmediainfo0/0.7.87/MediaInfo_DLL_0.7.87_GNU_FromSource.tar.xz &&\
	tar -xf mediainfo.tar.xz &&\
	cd MediaInfo_DLL_GNU_FromSource/ &&\
	./SO_Compile.sh &&\
	cd MediaInfoLib/Project/GNU/Library &&\
	make install &&\
	cd /MediaInfo_DLL_GNU_FromSource/ZenLib/Project/GNU/Library &&\
	make install &&\
	cd / &&\
	rm -r mediainfo.tar.xz &&\
	rm -r MediaInfo_DLL_GNU_FromSource &&\
	apk del --purge git build-base

# Should package this for alpine
#RUN apk add --no-cache git build-base &&\ 
#	wget -qO mediainfo.tar.xz https://mediaarea.net/download/binary/mediainfo/0.7.87/MediaInfo_CLI_0.7.87_GNU_FromSource.tar.xz &&\
#	tar -xf mediainfo.tar.xz &&\
#	cd MediaInfo_CLI_GNU_FromSource/ &&\
#	./CLI_Compile.sh &&\
#	cd MediaInfo/Project/GNU/CLI &&\
#	make install &&\
#	cd / &&\
#	rm -r mediainfo.tar.xz &&\
#	rm -r MediaInfo_CLI_GNU_FromSource &&\
#	apk del --purge git build-base


RUN wget -qO NzbDrone.tar.gz http://update.sonarr.tv/v2/master/mono/NzbDrone.master.tar.gz &&\
	tar -xzf NzbDrone.tar.gz &&\
	rm NzbDrone.tar.gz

CMD ["mono", "/NzbDrone/NzbDrone.exe"]

EXPOSE 8989
EXPOSE 9898
