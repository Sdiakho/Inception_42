FROM alpine:3.24.1

COPY ./entrypoint.sh /
COPY nginx.conf /etc/nginx/nginx.conf
RUN chmod +x /entrypoint.sh

RUN apk --no-cache add nginx libssl3 libcrypto3 musl openssl
RUN mkdir -p /etc/ssl/certs
RUN mkdir -p /etc/ssl/private


ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]