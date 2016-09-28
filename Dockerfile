FROM php:5-fpm-alpine

RUN docker-php-ext-install mbstring opcache pdo pdo_mysql mysqli

RUN echo "mbstring.http_input = pass" > /usr/local/etc/php/php.ini
RUN echo "mbstring.http_output = pass" >> /usr/local/etc/php/php.ini

RUN apk add --no-cache --virtual .build-deps \
        freetype-dev \
        libjpeg-turbo-dev \
        libpng-dev \
        libmcrypt-dev && \
    docker-php-ext-install iconv mcrypt && \
    docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && \
    docker-php-ext-install gd && \
    apk del .build-deps && \
    apk add --update libpng libmcrypt && \
    rm -rf /var/cache/apk/*

