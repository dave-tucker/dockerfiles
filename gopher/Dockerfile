FROM debian:latest
ADD https://gist.githubusercontent.com/belbomemo/b5e7dad10fa567a5fe8a/raw/4ed0c8a82a8d1b836e2de16a597afca714a36606/gistfile1.txt /usr/share/gopher.txt
RUN apt-get update && apt-get -y install lolcat
CMD cat /usr/share/gopher.txt | /usr/games/lolcat
