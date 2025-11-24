FROM debian:bookworm
#TODO vim 削除
RUN apt-get update && apt-get install -y nginx openssl vim && apt-get clean && rm -rf /var/lib/apt/lists/*
WORKDIR /etc/ssl/certs
RUN openssl genrsa -out inception.key 2048
RUN openssl req -x509 -nodes -newkey rsa:2048 -keyout inception.key -out inception.crt -subj "/CN=localhost"
RUN chmod 400 inception.crt
COPY default.conf /etc/nginx/conf.d/default.conf
CMD ["nginx", "-g", "daemon off;"]
