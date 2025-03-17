FROM alpine:3.20.6

RUN apk update && apk upgrade && \
    apk add --no-cache redis

COPY ./conf/redis.conf /etc/redis.conf

EXPOSE 6379

CMD [ "/etc/redis.conf" ]
ENTRYPOINT [ "redis-server" ]