FROM debian:jessie
MAINTAINER Dave Tucker <dave@dtucker.co.uk>

RUN apt-get update && apt-get -y install curl
RUN mkdir -p pocketmine
WORKDIR pocketmine
RUN curl -sL https://raw.githubusercontent.com/PocketMine/php-build-scripts/master/installer.sh | bash -s - -r
ADD server.properties .
ADD pocketmine.yml .
CMD ["./start.sh"]
