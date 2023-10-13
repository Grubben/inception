FROM alpine:3.17

# RUN apk update && apk upgrade && apk add --no-cache bash mariadb mariadb-client mariadb-server-utils
RUN apk update && apk upgrade && apk add --no-cache bash mariadb mariadb-client 

RUN sed -ie "s/#bind-address=0.0.0.0/bind-address=0.0.0.0/g" /etc/my.cnf.d/mariadb-server.cnf \
	&& sed -ie "s/skip-networking/# skip-networking/g" /etc/my.cnf.d/mariadb-server.cnf


# #unnecessary but explicit
# EXPOSE 3306

COPY script.sh .

RUN chmod +rwx script.sh
# COPY setup.sql /setup.sql
# RUN sh /script.sh

ENTRYPOINT [ "./script.sh" ]
