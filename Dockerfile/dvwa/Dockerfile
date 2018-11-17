FROM debian:lamp

WORKDIR /var/www/html

# pre-setup
ADD DVWA-master.zip dvwa/
ADD setup.sh ./

# setup
RUN sh setup.sh
ADD config.inc.php /var/www/html/dvwa/config/config.inc.php
COPY ./dvwa.conf /etc/supervisor/conf.d/dvwa.conf

# post-setup
RUN rm ./setup.sh

EXPOSE 80

CMD ["/usr/bin/supervisord"]
