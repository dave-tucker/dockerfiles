FROM alpine:3.6 AS build

ARG SABYENC_VERSION=3.0.2

RUN apk add --no-cache openssl \
	ca-certificates \
	build-base \
	python \
	python-dev \
	libffi-dev \
	openssl-dev \
	tar \
	autoconf \
	automake \
	py-setuptools
RUN update-ca-certificates
RUN mkdir -p /usr/share/par2cmdline && mkdir -p /out
WORKDIR /usr/share/par2cmdline
RUN wget -qO- https://github.com/Parchive/par2cmdline/archive/v0.6.14.tar.gz | \
	tar -xz --strip-components=1 --directory=/usr/share/par2cmdline && \
	aclocal && automake --add-missing && autoconf && \
	./configure --prefix /out --bindir /out/usr/local/bin && make && make install

RUN mkdir -p /usr/share/sabyenc
WORKDIR /usr/share/sabyenc
RUN wget -qO- https://github.com/sabnzbd/sabyenc/archive/v$SABYENC_VERSION.tar.gz | \
	tar -xz --strip-components=1 --directory=/usr/share/sabyenc && \
        python setup.py bdist && \
	tar -xf dist/sabyenc-3.0.2.linux-x86_64.tar.gz -C /out

FROM alpine:3.6

ARG SABNZBD_VERSION=2.2.0

RUN apk add --no-cache ca-certificates openssl python py-pip py-dbus py-openssl unrar unzip p7zip
RUN update-ca-certificates
RUN pip install Cheetah

COPY --from=build /out /

WORKDIR /

RUN mkdir -p /usr/share/sabnzdb
WORKDIR /usr/share/sabnzbd
RUN wget -qO- https://github.com/sabnzbd/sabnzbd/releases/download/$SABNZBD_VERSION/SABnzbd-$SABNZBD_VERSION-src.tar.gz| \
	tar -xz --strip-components=1 --directory /usr/share/sabnzbd

WORKDIR /root
EXPOSE 8080
VOLUME /root
VOLUME /mnt/media

ENTRYPOINT ["python", "/usr/share/sabnzbd/SABnzbd.py", "-s", "0.0.0.0:8080"]
