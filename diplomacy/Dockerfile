FROM debian:jessie
ENV DIPLOMACY_SALT KM6c6op0gIa2PnMXtWsSne9Ti33Vay
ENV DIPLOMACY_SECRET rNNB5Spt4Yx30iXDdUBBVbEFuTu3w0
ENV DIPLOMACY_GM_SECRET secret
ENV DIPLOMACY_JSON_SECRET secret
ENV DIPLOMACY_ADMIN_EMAIL admin@example.com
ENV DIPLOMACY_MOD_EMAIL mod@example.com
ENV DIPLOMACY_DOMAIN example.com
ENV SMTP_USERNAME admin
ENV SMTP_PASSWORD admin
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get -y install git-core \
	nginx \
	php5-fpm \
	php5-mysql \
	php5-gd
WORKDIR /usr/src/
RUN git clone https://github.com/kestasjk/webDiplomacy.git
RUN sed -i -e "s/\/var\/www\/html/\/usr\/src\/webDiplomacy/g" \
	-e "s/#location \~ \\\.php/location \~ \\\\.php/g" \
	-e "s/#\tfastcgi_pass unix:\/var\/run\/php5-fpm\.sock;/\tfastcgi_pass unix:\/var\/run\/php5-fpm.sock;\n\t\}/g" \
	/etc/nginx/sites-enabled/default
RUN mv /usr/src/webDiplomacy/config.sample.php /usr/src/webDiplomacy/config.php
RUN sed -i -e "s/database\_socket\='localhost'/database\_socket\='db:3306'/g" \
	-e "s/database_username\='webdiplomacy'/database_username\='root'/g" \
	-e "s/database_password\='mypassword123'/database_password\='diplomacy'/g" \
	-e "s/salt\=''/salt\='$DIPLOMACY_SALT'/g" \
	-e "s/secret\=''/secret\='$DIPLOMACY_SECRET'/g" \
	-e "s/gameMasterSecret\=''/gameMasterSecret\='$DIPLOMACY_GM_SECRET'/g" \
	-e "s/jsonSecret\=''/jsonSecret\='$DIPLOMACY_JSON_SECRET'/g" \
	-e "s/webmaster@yourdiplomacyserver.com/$DIPLOMACY_ADMIN_EMAIL/g" \
	-e "s/moderators@yourdiplomacyserver.com/$DIPLOMACY_MOD_EMAIL/g" \
	-e "s/yourdiplomacyserver\.com/$DIPLOMACY_DOMAIN_NAME/g" \
	-e "s/SMTPAuth\"\=\>false/SMTPAuth\"\=\>true/g" \
	-e "s/Username\"=>\"webmaster\"/Username\"=>\"$SMTP_USERNAME\"/g" \
	-e "s/Password\"=>\"password123\"/Password\"=>\"$SMTP_PASSWORD\"/g" \
	/usr/src/webDiplomacy/config.php
EXPOSE 80
RUN service nginx restart
CMD bash
