# Utiliser l'image officielle PHP avec Apache
FROM php:apache

# Installation des dépendances
RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev

# Clonez le depot Leed depuis GitHub
RUN curl -L -o v1.14.0.tar.gz https://github.com/LeedRSS/Leed/archive/refs/tags/v1.14.0.tar.gz && \
    tar -xf v1.14.0.tar.gz -C /var/www/html --strip-components=1 && \
    rm v1.14.0.tar.gz    

# Autorisation nécessaire
RUN chown -R www-data:www-data /var/www/html

# Port Expose
EXPOSE 80

# Launch Apache
CMD ["apache2-foreground"]

# Activation de l'extension MySQLi
RUN docker-php-ext-configure mysqli && docker-php-ext-install -j$(nproc) mysqli
# Activation de l'extension GD pour PHP
RUN docker-php-ext-configure gd && docker-php-ext-install -j$(nproc) gd
