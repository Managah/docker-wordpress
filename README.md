# ndthuan/wordpress

`docker pull ndthuan/wordpress`

WordPress Docker image with easy-to-customize PHP and sSMTP configs.

# Problems this image attempts to solve

You want to deploy a number of WP containers with slightly different PHP configs but you don't want to create a new ini file or a new Dockerfile for each of them. You want to change it by specifying some environment variables.

With this image, you can:
* change basic but important PHP configs like post limit, upload limit, session storage...
* configure sSMTP to send emails from a Docker container. When combined with something like Gmail SMTP, it ensures maximum email deliverability.

# The base image

This image is based on the standard image `wordpress:php7.3-apache`. Packaged WP version is 5.2 but it can be upgraded to the latest version using WP's update tool without an issue.

# Supported environment variables

* **WordPress** (see [all available vars](https://hub.docker.com/_/wordpress))
  * `WORDPRESS_DB_HOST`
  * `WORDPRESS_DB_USER`
  * `WORDPRESS_DB_PASSWORD`
  * `WORDPRESS_DB_NAME`
* **PHP** (see [all available vars](https://github.com/ndthuan/docker-wordpress/blob/master/confd/templates/zzz-nuphp.ini.tmpl))
  * `NUPHP_UPLOAD_MAX_FILESIZE` (default: 2M)
  * `NUPHP_POST_MAX_FILESIZE` (default: 8M)
  * `NUPHP_MEMORY_LIMIT` (default: 128M)
  * `NUPHP_EXPOSE_VERSION` (default: Off)
  * `NUPHP_SESSION_COOKIE_HTTPONLY` (default: On)
  * `NUPHP_SESSION_COOKIE_SECURE` (default: Off)
  * `NUPHP_SESSION_NAME` (default: PHPSESSID)
  * `NUPHP_SESSION_SAVE_HANDLER` (default: files)
  * `NUPHP_SESSION_SAVE_PATH` (default: empty)
* **SSMTP** (see [all available vars](https://github.com/ndthuan/docker-wordpress/blob/master/confd/templates/ssmtp.conf.tmpl))
  * `SSMTP_MAILHUB` (e.g. smtp.gmail.com:587)
  * `SSMTP_AUTH_USER` (e.g. youruser@gmail.com)
  * `SSMTP_AUTH_PASS` (e.g. your gmail password or app password if you've enabled 2FA authentication)
* **Apache Prefork** (see [all available vars](https://github.com/ndthuan/docker-wordpress/blob/master/confd/templates/mpm_prefork.conf.tmpl))
  * `PREFORK_START_SERVERS` (default: 1)
  * `PREFORK_MIN_SPARE_SERVERS` (default: 1)
  * `PREFORK_MAX_SPARE_SERVERS` (default: 3)
  * `PREFORK_MAX_REQUEST_WORKERS` (default: 150)

# Contribution

You are more than welcome to fork and contribute to https://github.com/ndthuan/docker-wordpress by creating PRs and reporting issues.
