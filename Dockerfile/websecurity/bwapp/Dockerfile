FROM debian:lamp

WORKDIR /var/www/html

# pre-setup
ADD bWAPP_latest.zip ./
ADD setup.sh ./

# setup
RUN sh setup.sh

# post-setup
ADD ./bwapp.conf /etc/supervisor/conf.d/bwapp.conf
RUN rm ./bWAPP_latest.zip && rm ./setup.sh

EXPOSE 80

CMD ["/usr/bin/supervisord"]
