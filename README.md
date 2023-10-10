# Knowledge gained for the Inception Project

## Setting up the VM
apt install -y sudo ufw docker docker-compose make openbox xinit kitty firefox-esr

## docker
```
docker run nginx
docker run -d nginx
docker run -p80:80 nginx
docker run -p80:80 -v ~/nginx-html:/usr/share/nginx/html nginx
docker run -d --name my-nginx nginx
```
```
docker ps
docker ps -a
```

```
docker rm 123123asdf3
docker rm my-nginx
docker rm -f my-nginx
docker rm -f (docker ps -aq)
```

```
docker images
docker images -aq
docker image rm $(docker images -aq)
```

## docker-compose
 > **docker-compose** is used to manage docker containers

Instead of writing
```
docker run -p80:80 -v ~/nginx-html:/usr/share/nginx/html --name my-nginx nginx
```
we put in our docker-compose.yml
```
services:
  ng:
    image: nginx
    ports:
      - 80:80
    volumes:
      - ~/myInception/nginx-html:/usr/share/nginx/html

```

> File structure:
> > Now in this repo

Since we can't use the nginx image, we will now create our own
> nginx/Dockerfile