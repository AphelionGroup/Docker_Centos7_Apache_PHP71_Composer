# docker-centos-apache-php7.1
Docker with CentOS 7, systemd, Apache2, PHP7.1, crond, composer and pagespeed

# Pull

```
docker pull apheliongroup/centos7-apache-php71
```

# Running Container

```
docker run -v /opt/docker/docker_test/data:/var/www/page  --restart=always -d -it apheliongroup/centos7-apache-php71
```

# Attach Container

```
docker exec apheliongroup/centos7-apache-php71 /bin/bash
```
