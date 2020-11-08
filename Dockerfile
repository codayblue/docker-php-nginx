FROM php:7.4-fpm-alpine3.12

ARG TARGETPLATFORM

COPY s6/install.sh /tmp/install.sh
RUN chmod +x /tmp/install.sh && /tmp/install.sh ${TARGETPLATFORM}

RUN apk add --no-cache nginx $PHPIZE_DEPS \
    && ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

COPY s6/services /etc/services.d
COPY nginx/ /etc/nginx/conf.d

ENTRYPOINT [ "/init" ]
CMD [ "php-fpm" ]