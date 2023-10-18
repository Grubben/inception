FROM alpine:3.17

RUN apk -U upgrade && apk add --no-cache mariadb mariadb-client 

RUN sed -ie "s/#bind-address=0.0.0.0/bind-address=0.0.0.0/g" /etc/my.cnf.d/mariadb-server.cnf
RUN sed -ie "s/skip-networking/# skip-networking/g" /etc/my.cnf.d/mariadb-server.cnf

# #unnecessary but explicit
EXPOSE 3306

COPY script.sh .

ENTRYPOINT [ "./script.sh" ]
