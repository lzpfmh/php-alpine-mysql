FROM php:5.5-fpm-alpine
RUN docker-php-ext-install pdo pdo_mysql mysqli

