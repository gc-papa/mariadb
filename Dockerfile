FROM alpine:latest

RUN apk add --no-cache mariadb-client mysql-client

COPY ./scripts/dump-database.sh /scripts/dump-database.sh

RUN chmod +x /scripts/dump-database.sh && \
    echo "0 * * * * /scripts/dump-database.sh" | crontab -

CMD ["crond", "-f", "-d", "8"]