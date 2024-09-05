FROM serversideup/php:7.4-fpm-nginx

ENV PHP_OPCACHE_ENABLE=1

USER root

RUN docker-php-ext-install calendar

RUN curl -sL https://deb.nodesource.com/setup_20.x | bash -
RUN apt-get install -y nodejs

COPY . /var/www/html
RUN chown www-data:www-data /var/www/html
RUN rm .env

USER www-data

RUN npm install
RUN npm run prod
