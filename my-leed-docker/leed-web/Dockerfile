# Utiliser l'image officielle PHP avec Apache
FROM php:apache

# Installez les dépendances nécessaires

RUN apt update && \
    apt install -y git && \
    rm -rf /var/lib/apt/lists*

# Clonez le depot Leed depuis GitHub
RUN git clone https://github.com/LeedRSS/Leed /var/www/html/leed

# Autorisation nécessaire
RUN chown -R www-data:www-data /var/www/html/leed

# Port Expose
EXPOSE 80

# Launch Apache
CMD ["apache2-foreground"]

