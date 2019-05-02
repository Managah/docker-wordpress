FROM wordpress:php7.3-apache

ADD confd /etc/confd
ADD nuphp-entrypoint.sh /usr/local/bin/
ADD https://github.com/kelseyhightower/confd/releases/download/v0.16.0/confd-0.16.0-linux-amd64 /usr/local/bin/confd

RUN chmod +x /usr/local/bin/confd
RUN chmod +x /usr/local/bin/nuphp-entrypoint.sh

ENTRYPOINT [ "nuphp-entrypoint.sh" ]
CMD [ "apache2-foreground" ]
