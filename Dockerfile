FROM php:5-fpm-alpine
RUN docker-php-ext-install gd mbstring opcache pdo pdo_mysql mysqli

RUN echo "mbstring.http_input = pass" > /usr/local/etc/php/php.ini
RUN echo "mbstring.http_output = pass" >> /usr/local/etc/php/php.ini

