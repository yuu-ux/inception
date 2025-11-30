FROM debian:bookworm

RUN apt-get update && \
    apt-get install -y php-fpm php-mysql \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY wordpress-6.8.3-ja.zip /tmp/

RUN unzip /tmp/wordpress-6.8.3-ja.zip -d /var/www/ && \
    mv /var/www/wordpress /var/www/html && \
    chown -R www-data:www-data /var/www/html

COPY ./conf/www.conf /etc/php/*/fpm/pool.d/www.conf

CMD ["php-fmt", "-F"]
