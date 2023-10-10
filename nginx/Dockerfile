FROM alpine

RUN apk upgrade && apk add --no-cache nginx

CMD ["nginx", "-g", "daemon-off;"]