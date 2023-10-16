FROM alpine:3.17

RUN apk -U upgrade && apk add --no-cache nginx curl bash

RUN curl -JLO "https://dl.filippo.io/mkcert/latest?for=linux/amd64"
RUN chmod +x mkcert-v*-linux-amd64
RUN cp mkcert-v*-linux-amd64 /usr/local/bin/mkcert

RUN mkcert amaria-d.42.fr

RUN cp amaria-d.42.fr* /etc/ssl/certs/

COPY nginx.conf /etc/nginx/nginx.conf

#unnecessary but explicit
EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
