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

* **UID and GID**
  * `NEW_WWW_DATA_UID`
  * `NEW_WWW_DATA_GID`
* **WordPress** (see [all available vars](https://hub.docker.com/_/wordpress))
  * `WORDPRESS_DB_HOST`
  * `WORDPRESS_DB_USER`
  * `WORDPRESS_DB_PASSWORD`
  * `WORDPRESS_DB_NAME`
* **PHP**
  * `NUPHP_UPLOAD_MAX_FILESIZE` (default: 2M)
  * `NUPHP_POST_MAX_FILESIZE` (default: 8M)
  * `NUPHP_MEMORY_LIMIT` (default: 128M)
  * `NUPHP_EXPOSE_VERSION` (default: Off)
  * `NUPHP_SESSION_COOKIE_HTTPONLY` (default: On)
  * `NUPHP_SESSION_COOKIE_SECURE` (default: Off)
  * `NUPHP_SESSION_NAME` (default: PHPSESSID)
  * `NUPHP_SESSION_SAVE_HANDLER` (default: files)
  * `NUPHP_SESSION_SAVE_PATH` (default: empty)
* **MSMTP**
  * `MSMTP_HOST` (default: smtp.gmail.com)
  * `MSMTP_PORT` (default: 587)
  * `MSMTP_USER` (e.g. youruser@gmail.com)
  * `MSMTP_PASSWORD` (e.g. your gmail password or app password if you've enabled 2FA authentication)
* **Apache Prefork**
  * `PREFORK_START_SERVERS` (default: 3)
  * `PREFORK_MIN_SPARE_SERVERS` (default: 3)
  * `PREFORK_MAX_SPARE_SERVERS` (default: 10)
  * `PREFORK_MAX_REQUEST_WORKERS` (default: 150)

See all available variables at https://github.com/ndthuan/docker-wordpress/blob/master/nuphp-entrypoint.sh

# Contribution

You are more than welcome to fork and contribute to https://github.com/ndthuan/docker-wordpress by creating PRs and reporting issues.
