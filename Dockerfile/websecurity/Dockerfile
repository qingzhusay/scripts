FROM debian:lamp

WORKDIR /var/www/html

# dvwa
ADD dvwa/dvwa dvwa
ADD dvwa/setup.sh ./dvwa_setup.sh
RUN sh dvwa_setup.sh
ADD dvwa/config.inc.php dvwa/config/config.inc.php
RUN rm ./dvwa_setup.sh

# dvwa
ADD bwapp/bWAPP_latest.zip ./
ADD bwapp/setup.sh ./bwapp_setup.sh
RUN sh bwapp_setup.sh
RUN rm bWAPP_latest.zip bwapp_setup.sh

ADD websecurity.conf /etc/supervisor/conf.d/

EXPOSE 80

CMD ["/usr/bin/supervisord"]
