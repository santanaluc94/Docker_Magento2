FROM php:8.1-fpm

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
    libkrb5-dev \
    libgmp-dev \
    libpng-dev \
    libzip-dev \
    libxml2-dev \
    libxslt-dev \
    make \
    nano \
    tar \
    unzip \
    vim \
    wget \
    && rm -r /var/lib/apt/lists/*

RUN docker-php-ext-configure imap --with-kerberos --with-imap-ssl

RUN apt-get update -y && apt-get upgrade -y

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

# Composer Install
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=2.2.4

# Install Magento
RUN composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition=2.4.5-p1 .
RUN composer install
RUN bin/magento setup:install \
--base-url=http://localhost/ \
--backend-frontname=admin \
--db-host=db \
--db-name=magento \
--db-user=admin \
--db-password=admin123 \
--admin-firstname=admin \
--admin-lastname=admin \
--admin-email=admin@admin.com \
--admin-user=admin \
--admin-password=admin123 \
--language=pt_BR \
--currency=BRL \
--timezone=America/Sao_Paulo \
--use-rewrites=1 \
--amqp-host=rabbitmq \
--amqp-port=5672 \
--amqp-user=magento \
--amqp-password=magento \
--search-engine=elasticsearch7 \
--elasticsearch-host=elasticsearch \
--elasticsearch-port=9200 \
--cleanup-database

EXPOSE 8000