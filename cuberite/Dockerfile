FROM debian:jessie
MAINTAINER Dave Tucker <dave@dtucker.co.uk>

WORKDIR /cuberite
RUN apt-get update && apt-get install -y wget curl
RUN sh -c "$(wget -O - https://raw.githubusercontent.com/cuberite/cuberite/master/easyinstall.sh)"

WORKDIR /var/cuberite
CMD ["/cuberite/Server/Cuberite"]

VOLUME /var/cuberite
EXPOSE 25565
