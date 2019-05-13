FROM wordpress:php7.3-apache

RUN apt-get update && \
  apt-get install -y ssmtp && \
  apt-get clean && \
  echo 'sendmail_path = "/usr/sbin/ssmtp -t"' > /usr/local/etc/php/conf.d/zzz-mail.ini

ADD confd /etc/confd
ADD nuphp-entrypoint.sh /usr/local/bin/
ADD https://github.com/kelseyhightower/confd/releases/download/v0.16.0/confd-0.16.0-linux-amd64 /usr/local/bin/confd

RUN chmod +x /usr/local/bin/confd
RUN chmod +x /usr/local/bin/nuphp-entrypoint.sh

ENTRYPOINT [ "nuphp-entrypoint.sh" ]
CMD [ "apache2-foreground" ]
