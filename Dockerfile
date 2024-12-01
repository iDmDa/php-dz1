FROM php:8.2-fpm

# Устанавливаем необходимые зависимости
RUN apt-get update && apt-get install -y \
    libpng-dev libjpeg-dev libfreetype6-dev && \
    docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install gd

# Копируем файлы проекта
COPY . /var/www/html

# Указываем рабочую директорию
WORKDIR /var/www/html

# Устанавливаем правильные права
RUN chown -R www-data:www-data /var/www/html
