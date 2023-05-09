ARG PHP_VERSION

FROM php:${PHP_VERSION}-fpm

# Linux Dependencies
RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends \
    apt-utils \
    curl \
    cron \
    dialog \
    freetds-dev \
    git \
    libc-client-dev \
    libfreetype6-dev \
    libgmp-dev \
    libkrb5-dev \
    libjpeg-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libsodium-dev \
    libxml2-dev \
    libxslt-dev \
    libzip-dev \
    make \
    nano \
    ssh \
    tar \
    unzip \
    vim \
    wget \
    zlib1g-dev \
    && rm -r /var/lib/apt/lists/*

RUN docker-php-ext-configure imap --with-kerberos --with-imap-ssl

RUN apt-get update -y && apt-get upgrade -y

RUN docker-php-ext-configure gd --with-jpeg --with-freetype

RUN docker-php-ext-install -j$(nproc) \
    bcmath \
    calendar \
    ctype \
    exif \
    dom \
    gd \
    gettext \
    gmp \
    iconv \
    intl \
    imap \
    mysqli \
    pcntl \
    pdo_dblib \
    pdo_mysql \
    shmop \
    simplexml \
    soap \
    sockets \
    sysvmsg \
    sysvsem \
    sysvshm \
    xmlwriter \
    xsl \
    zip

# Install Xdebug
RUN pecl install xdebug && docker-php-ext-enable xdebug

# Composer Install
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=2.2.21