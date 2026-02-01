FROM php:8.1-apache

# Install required extensions
RUN docker-php-ext-install pdo pdo_mysql

# Copy application files
COPY . /var/www/html/

# Set permissions
RUN chown -R www-data:www-data /var/www/html/
RUN chmod -R 755 /var/www/html/

# Enable Apache modules
RUN a2enmod rewrite

# Configure Apache
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

EXPOSE 80

# Start Apache
CMD ["apache2-foreground"]
