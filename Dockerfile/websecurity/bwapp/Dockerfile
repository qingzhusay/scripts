FROM debian:lamp

# pre-setup
ADD bWAPP_latest.zip /var/www/html/
ADD setup.sh ./

# setup
RUN sh setup.sh && rm ./setup.sh

# post-setup
ADD ./bwapp.conf /etc/supervisor/conf.d/bwapp.conf

EXPOSE 80

CMD ["/usr/bin/supervisord"]
