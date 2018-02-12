FROM php:5.6-apache

# Enable mod_rewrite
RUN a2enmod rewrite headers
RUN a2dissite 000-default

# Setup virtual hosts
COPY ./php56/virtualhost.conf /etc/apache2/sites-enabled/virtualhost-php56.conf
RUN a2ensite virtualhost-php56

# Copy php.ini
COPY ./php56/php.ini /usr/local/etc/php/conf.d/php.ini

# Link log files
RUN touch /var/www/56_error.log /var/www/56_access.log
RUN chown www-data:www-data /var/www/56_error.log /var/www/56_access.log

# Update
RUN apt-get update 

# Install libraries
RUN apt-get install -y \
        libmcrypt-dev \
    && docker-php-ext-install -j$(nproc) \
        bcmath \
        iconv \
        mcrypt \
        mysql \
        mysqli \
        pdo_mysql \
        calendar