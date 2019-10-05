FROM wordpress:php7.3-apache

RUN apt-get update && \
  apt-get install -y msmtp && \
  apt-get clean

ADD nuphp-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/nuphp-entrypoint.sh

ENTRYPOINT [ "nuphp-entrypoint.sh" ]
CMD [ "apache2-foreground" ]
