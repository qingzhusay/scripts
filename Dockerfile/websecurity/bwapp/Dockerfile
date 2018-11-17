FROM debian:lamp

# must grant to 'root'@'localhost' that identified by 'bug'
RUN /etc/init.d/mysql start && \
  mysql -e "grant all privileges on *.* to 'root'@'localhost' identified by 'bug';" && \
  mysql -uroot -pbug -e "grant all privileges on *.* to 'alice'@'%' identified by 'loveZombies';" && \
  mysql -ualice -ploveZombies -e "show databases;"

COPY ./bwapp.conf /etc/supervisor/conf.d/bwapp.conf

# copy
ADD bWAPP_latest.zip /var/www/html/

# download
#RUN wget https://nchc.dl.sourceforge.net/project/bwapp/bWAPP/bWAPP_latest.zip

RUN apt-get -y update --fix-missing && apt-get -y install unzip curl supervisor && apt-get clean autoremove

WORKDIR /var/www/html
RUN unzip bWAPP_latest.zip && rm bWAPP_latest.zip && rm /var/www/html/index.html

RUN /etc/init.d/mysql restart && /etc/init.d/apache2 restart && \
  curl http://127.0.0.1/bWAPP/install.php?install=yes 1> /dev/null && \
  echo "Success!"

EXPOSE 80

CMD ["/usr/bin/supervisord"]
