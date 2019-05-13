# docker-wordpress
WordPress Docker image with customisable PHP and sSMTP configs.

It allows you to change things like upload limit, SMTP server... using environment variables without creating a new Dockerfile.

This image is based on Docker's standard image `wordpress:php7.3-apache`. Packaged Wordpress version is 5.2 but it can be upgraded using WP's update tool without an issue. So if this image contains a little bit outdated version of WP, it shouldn't be a problem.

# Docker image

`docker pull ndthuan/wordpress`

# Environment variables

* All variables as documented on https://hub.docker.com/_/wordpress.
* PHP environment vars (open [PHP config template](confd/templates/zzz-nuphp.ini.tmpl) to see all available vars)
  * `NUPHP_UPLOAD_MAX_FILESIZE` (default: 2M)
  * `NUPHP_POST_MAX_FILESIZE` (default: 8M)
  * `NUPHP_MEMORY_LIMIT` (default: 128M)
  * `NUPHP_EXPOSE_VERSION` (default: Off)
  * `NUPHP_SESSION_COOKIE_HTTPONLY` (default: On)
  * `NUPHP_SESSION_COOKIE_SECURE` (default: Off)
  * `NUPHP_SESSION_NAME` (default: PHPSESSID)
  * `NUPHP_SESSION_SAVE_HANDLER` (default: files)
  * `NUPHP_SESSION_SAVE_PATH` (default: empty)
* SSMTP environment vars (open [ssmtp config template](confd/templates/ssmtp.conf.tmpl) to see all available vars)
  * `SSMTP_MAILHUB` (e.g. smtp.gmail.com:587)
  * `SSMTP_AUTH_USER` (e.g. youruser@gmail.com)
  * `SSMTP_AUTH_PASS` (e.g. your gmail password or app password if you've enabled 2FA authentication)
