FROM debian:bookworm

RUN apt-get update && \
    apt-get install -y unzip php-fpm php-mysql \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY wordpress-6.8.3-ja.zip /usr/src/wordpress.zip

COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf

# 初回起動時に /var/www/html が空なら展開するエントリポイント
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["php-fpm8.2", "-F"]
