# Using alpine base image instead of nginx-alpine to support fancyindex

FROM alpine:latest

# Install necessary packages
RUN apk update && \
    apk add nginx-mod-http-fancyindex

# Make necessary fs changes to suit my config
RUN mkdir -p /var/log/nginx/mirror.int3nse.com && \
    rm /etc/nginx/http.d/default.conf

# For certbot auto-renewal
COPY ./sites/letsencrypt.conf /etc/nginx/snippets/letsencrypt.conf
RUN mkdir -p /var/www/letsencrypt/.well-known/acme-challenge

ENTRYPOINT nginx -g 'daemon off;'
