# docker-php-confd-template
PHP config template in [confd](https://github.com/kelseyhightower/confd) format.

This repository provides some files ready to copy and paste when creating a new PHP image that supports changing configuration using ENV vars.

# Usage 1
* Manually copy confd and nuphp-entrypoint.sh into your Docker image repository
* Copy content of example.Dockerfile into your Dockerfile and modify it per your needs
* Build as normal

# Usage 2 (recommended)
* Add this repo as a remote `git remote add phptmpl https://github.com/ndthuan/docker-php-confd-template.git`
* Fetch `git fetch phptmpl`
* Merge `git merge phptmpl/master --allow-unrelated-histories`
* Copy content of example.Dockerfile into your Dockerfile and modify it per your needs
* Build as normal

This way has more steps but you can easily get new changes from this repo by fetching and merging.

# Supported ENV vars
* NUPHP_UPLOAD_MAX_FILESIZE (default: 2M)
* NUPHP_POST_MAX_FILESIZE (default: 8M)
* NUPHP_MEMORY_LIMIT (default: 128M)
* NUPHP_EXPOSE_VERSION (default: Off)
* NUPHP_SESSION_COOKIE_HTTPONLY (default: On)
* NUPHP_SESSION_COOKIE_SECURE (default: Off)
* NUPHP_SESSION_NAME (default: PHPSESSID)
* NUPHP_SESSION_SAVE_HANDLER (default: files)
* NUPHP_SESSION_SAVE_PATH (default: empty)

# Build a test image
```bash
docker build --no-cache -t wp:test -f example.Dockerfile .
```

# Test the built image
```bash
docker run --rm wp:test php -i | grep upload_max
```
Should print `upload_max_filesize => 2M => 2M`.

```bash
docker run --rm -e NUPHP_UPLOAD_MAX_FILESIZE=5M wp:test php -i | grep upload_max
```
Should print `upload_max_filesize => 5M => 5M`.
