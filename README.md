# docker-centos7_apache_php71
Docker with CentOS 7, systemd, Apache2, PHP7.1, crond, composer and pagespeed

# Pull

```
docker pull apheliongroup/centos7_apache_php71
```

# Running Container

```
docker run -v /opt/docker/docker_test/data:/var/www/page  --restart=always -d -it apheliongroup/centos7_apache_php71
```

# Attach Container

```
docker exec apheliongroup/centos7_apache_php71 /bin/bash
```
