FROM debian:bookworm

RUN apt-get update && \
    apt-get install -y mariadb-server \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN mysql_install_db --user=mysql --ldata=/var/lib/mysql

COPY ./conf/my.cnf /etc/my.cnf

COPY ./conf/init.sql /docker-entrypoint-initdb.d/init.sql

EXPOSE 3306

CMD ["mysqld_safe"]
