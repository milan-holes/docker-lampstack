FROM php:7.1-apache 

# Enable mod_rewrite
RUN a2enmod rewrite headers
RUN a2dissite 000-default

# Copy php.ini
COPY ./php7/php.ini /usr/local/etc/php/conf.d/php.ini

# Setup virtual hosts
COPY ./php7/virtualhost.conf /etc/apache2/sites-available/virtualhost-php71.conf
RUN a2ensite virtualhost-php71

# Link log files
RUN touch /var/www/71_error.log /var/www/71_access.log
RUN chown www-data:www-data /var/www/71_error.log /var/www/71_access.log

# Update
RUN apt-get update

# Install libraries
RUN apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
        libpng-dev \
        git \
        zip \
        unzip \
        vim \
        mysql-client \
        net-tools \
    && docker-php-ext-install -j$(nproc) \
        bcmath \
        iconv \
        mcrypt \
        mysqli \
        opcache \
        pdo_mysql \
        calendar \
    && docker-php-ext-enable calendar

# Install gd
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd

# Install intl
RUN apt-get update && apt-get install -y zlib1g-dev libicu-dev g++
RUN docker-php-ext-configure intl
RUN docker-php-ext-install intl

# Install Memcached
RUN apt-get update \
  && apt-get install -y libmemcached-dev zlib1g-dev \
  && pecl install memcached \
  && docker-php-ext-enable memcached

# Install nodejs
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
    && apt-get update && apt-get install -y \
        nodejs 

# Install Gulp & Grunt
RUN npm install -g grunt gulp

# Install composer
RUN curl -s https://getcomposer.org/installer > composer-setup.php \
    && php composer-setup.php --install-dir=/usr/bin --filename=composer \
    && rm composer-setup.php 