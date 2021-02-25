#/bin/sh

set -ex

TAGS='php7.3-apache php7.4-apache'

for tag in $TAGS; do
    docker pull wordpress:${tag}
    docker build -t managah/wordpress:${tag} --build-arg BASE_TAG=${tag} -f apache2.Dockerfile .
    docker run --name ${tag} --rm -d -p8888:80 managah/wordpress:${tag}
    sleep 2
    curl -s -i 'http://localhost:8888' | grep -q '302 Found' || (echo "$tag not started" && (docker rm -fv ${tag} || true) && exit 1)
    docker rm -fv ${tag}
done

for tag in $TAGS; do
    docker push managah/wordpress:${tag}
done
