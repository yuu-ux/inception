FROM debian:bookworm

RUN apt-get update && \
    apt-get install -y unzip php-fpm php-mysql \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY wordpress-6.8.3-ja.zip /tmp/

RUN set -eux; unzip /tmp/wordpress-6.8.3-ja.zip -d /var/www/ && \
    mv /var/www/wordpress /var/www/html && \
    chown -R www-data:www-data /var/www/html

COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf

CMD ["php-fpm", "-F"]
