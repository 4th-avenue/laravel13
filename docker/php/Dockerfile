FROM php:8.5.5-fpm

# COPY php.ini
COPY ./docker/php/php.ini /usr/local/etc/php/php.ini

# Composer Install
COPY --from=composer:2.9.7 /usr/bin/composer /usr/bin/composer

# Install Node.js
COPY --from=node:24.15.0 /usr/local/bin /usr/local/bin
COPY --from=node:24.15.0 /usr/local/lib /usr/local/lib

RUN apt-get update && apt-get install -y \
    git \
    zip \
    unzip \
    vim \
    libicu-dev \
    libzip-dev \
    libfreetype-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
	&& docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install pdo_mysql bcmath intl zip pcntl \
    && pecl install redis xdebug \
    && docker-php-ext-enable redis xdebug \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html