FROM alpine:3.17

RUN apk update && apk upgrade && apk add --no-cache curl php-fpm

#unnecessary but explicit
EXPOSE 9000

CMD ["nginx", "-g", "daemon off;"]
