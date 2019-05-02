# docker-wordpress
WordPress Docker image with customisable PHP configs.

This image is based on Docker's standard image `wordpress:php7.3-apache`. Current WordPress is 5.1.1, it's subject to be updated to the latest version at any time, and that shouldn't be a problem of using this image.

# Docker image
`docker pull ndthuan/wordpress`

# Environment variables

* All variables as documented on https://hub.docker.com/_/wordpress.
* NUPHP_UPLOAD_MAX_FILESIZE (default: 2M)
* NUPHP_POST_MAX_FILESIZE (default: 8M)
* NUPHP_MEMORY_LIMIT (default: 128M)
* NUPHP_EXPOSE_VERSION (default: Off)
* NUPHP_SESSION_COOKIE_HTTPONLY (default: On)
* NUPHP_SESSION_COOKIE_SECURE (default: Off)
* NUPHP_SESSION_NAME (default: PHPSESSID)
* NUPHP_SESSION_SAVE_HANDLER (default: files)
* NUPHP_SESSION_SAVE_PATH (default: empty)
