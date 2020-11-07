FROM php:7.4-fpm-alpine3.12

ADD https://github.com/just-containers/s6-overlay/releases/download/v2.1.0.2/s6-overlay-amd64-installer /tmp/
RUN chmod +x /tmp/s6-overlay-amd64-installer && /tmp/s6-overlay-amd64-installer /

RUN apk add --no-cache nginx $PHPIZE_DEPS \
    && ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log 

COPY s6/services /etc/services.d
COPY nginx/ /etc/nginx/conf.d

ENTRYPOINT [ "/init" ]
CMD [ "php-fpm" ]