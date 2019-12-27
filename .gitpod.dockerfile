FROM gitpod/workspace-full:latest

USER root

RUN apt-get update && apt-get -y install apache2 mysql-server php-curl php-gd php-mbstring php-xml php-xmlrpc 

# optional: use a custom apache config.
COPY apache.conf /etc/apache2/apache2.conf

# optional: change document root folder. It's relative to your git working copy.
ENV APACHE_DOCROOT_IN_REPO="www"

RUN mkdir /var/run/mysqld
RUN chown gitpod:gitpod /var/run/apache2 /var/lock/apache2 /var/run/mysqld

RUN addgroup gitpod www-data
