FROM alpine:3.17

RUN apk update && apk upgrade && apk add --no-cache bash mariadb mariadb-client mariadb-server-utils

# #unnecessary but explicit
# EXPOSE 3306

# COPY script.sh /script.sh
# COPY setup.sql /setup.sql
# RUN sh /script.sh

CMD ["tail", "-f", "/dev/null"]
