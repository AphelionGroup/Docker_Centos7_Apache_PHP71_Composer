FROM centos:latest

MAINTAINER "AphelianoGroup" <support@aphelion-group.com.com>

ENV container docker

RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
 && rpm -Uvh https://rpms.remirepo.net/enterprise/remi-release-7.rpm

# Apply updates
RUN yum -y update

# Install tools
RUN yum -y install yum-utils epel-release iproute at curl crontabs git

# Enable PHP 7.1 repo
RUN yum-config-manager --enable remi-php71

# Install PHP & Apache
RUN yum -y install php mod_php php-opcache php-cli php-common php-gd php-intl php-mbstring php-mcrypt php-mysqlnd php-mssql php-pdo php-pear php-soap php-xml php-xmlrpc php-tidy php-zip httpd

# pagespeed
RUN curl -O https://dl-ssl.google.com/dl/linux/direct/mod-pagespeed-stable_current_x86_64.rpm \
 && rpm -U mod-pagespeed-*.rpm \
 && yum clean all \
 && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
 && php composer-setup.php --install-dir=bin --filename=composer \
 && php -r "unlink('composer-setup.php');" \
 && rm -rf /etc/localtime \
 && ln -s /usr/share/zoneinfo/Europe/London /etc/localtime

# we want some config changes
COPY config/php_settings.ini /etc/php.d/
COPY config/v-host.conf /etc/httpd/conf.d/

# create webserver-default directory
RUN mkdir -p /var/www/page/public

EXPOSE 80

RUN systemctl enable httpd \
 && systemctl enable crond

CMD ["/usr/sbin/init"]
