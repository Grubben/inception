FROM alpine:3.17

RUN apk update && apk upgrade && apk add --no-cache nginx

COPY amaria-d.42.fr.pem     /etc/ssl/certs/
COPY amaria-d.42.fr-key.pem /etc/ssl/certs/

CMD ["nginx", "-g", "daemon off;"]
