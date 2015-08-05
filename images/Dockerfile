FROM phusion/baseimage
MAINTAINER wellic wellic72@gmail.com

CMD ["/sbin/my_init"]

WORKDIR /tmp

RUN apt-get update && apt-get install -y python-software-properties

RUN DEBIAN_FRONTEND=noninteractive \
 apt-get -y install \
 apache2 \
 libapache2-mod-php5 \
 php5-mysql \
 php5-gd \
 php5-curl \ 
 php5-mcrypt \
 php5-xdebug \
 php5-curl \
 php5-sqlite \ 
 php5-xsl \
 php5-intl \
 php-pear \
 php-apc \
 git \
 mc \
 curl \
 wget \
 lynx-cur


# Install composer
RUN curl -sS https://getcomposer.org/installer | php && \
 mv composer.phar /usr/local/bin/composer

# Install phpunit
RUN  wget https://phar.phpunit.de/phpunit.phar && \
 chmod +x phpunit.phar; \
 mv phpunit.phar /usr/local/bin/phpunit

# Enable apache mods and xdebug
RUN a2enmod php5 vhost_alias rewrite
RUN php5enmod xdebug

# Update the PHP.ini file, enable <? ?> tags and quieten logging.
RUN sed -i "s/short_open_tag = Off/short_open_tag = On/" /etc/php5/apache2/php.ini
RUN sed -i "s/error_reporting = .*$/error_reporting = E_ERROR | E_WARNING | E_PARSE/" /etc/php5/apache2/php.ini

# Manually set up the apache environment variables
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid

#RUN echo "daemon off;" >> /etc/nginx/nginx.conf
#RUN ln -sf /dev/stdout /var/log/nginx/access.log
#RUN ln -sf /dev/stderr /var/log/nginx/error.log

# start apache service
RUN mkdir -p /etc/service/apache
ADD start.sh /etc/service/apache/run
RUN chmod +x /etc/service/apache/run

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /opt

EXPOSE 80 9000

