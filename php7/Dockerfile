FROM php:7.1-apache
RUN apt-get update && apt-get install -y \
    && docker-php-ext-install -j$(nproc) iconv mcrypt mysqli \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd

RUN a2enmod rewrite headers

RUN a2dissite 000-default

COPY ./php7/php.ini /usr/local/etc/php/conf.d/php.ini

COPY ./php7/virtualhost.conf /etc/apache2/sites-available/virtualhost-php71.conf
RUN a2ensite virtualhost-php71

RUN touch /var/www/71_error.log /var/www/71_access.log
RUN chown www-data:www-data /var/www/71_error.log /var/www/71_access.log

RUN apt-get update && apt-get install -y zlib1g-dev libicu-dev g++
RUN docker-php-ext-configure intl
RUN docker-php-ext-install intl

RUN apt-get install -y \
        libicu-dev \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
        libpng-dev \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) \
        bcmath \
        gd \
        iconv \
        intl \
        mcrypt \
        mysqli \
        opcache \
        pdo_mysql
