# Use official PHP 8.4 FPM image
# IMPORTANT: This PHP version must match the PHP version required by your Laravel app
# (Check with: php -v OR composer.json "php" requirement)
FROM php:8.4-fpm
# Install system dependencies + PHP extensions required by Laravel
RUN apt-get update && apt-get install -y \
    # Git → needed for composer packages
    git \
    # Unzip → required to extract composer packages
    unzip \
    # libpng-dev → required for GD (image processing in Laravel)
    libpng-dev \
    # libzip-dev → required for ZIP extension (file compression)
    libzip-dev \
    # libonig-dev → required for mbstring (string handling)
    libonig-dev \
    # libxml2-dev → required for XML parsing
    libxml2-dev \
    \
    # Install PHP extensions required by Laravel
    && docker-php-ext-install \
        # PDO MySQL → Required for MySQL database connection
        pdo_mysql \
        # ZIP → Required for file compression / Laravel packages
        zip \
        # GD → Required for image manipulation
        gd \
    \
    # Install Redis extension via PECL (Laravel uses Redis for cache, queue, sessions)
    && pecl install redis \
    \
    # Enable Redis extension in PHP
    && docker-php-ext-enable redis \
    \
    # Clean up to reduce image size
    && rm -rf /var/lib/apt/lists/*
# Set working directory inside container
# All Laravel project files will live here
WORKDIR /var/www
