# Knowledge gained for the Inception Project

## Setting up the VM
apt install -y sudo ufw docker docker-compose make openbox xinit kitty firefox-esr
apt install -y mkcert

## Vbox - Shared folders
To not always be copying or git push-pulling back and forth I've made a vbox shared folder
> [https://wiki.debian.org/VirtualBox]

Removed auto-mount
To mount:
```
mkdir ~/incep
sudo mount -t vboxsf inception ~/incep
```
inception is the name of the shared folder


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
docker rm -f $(docker ps -aq)
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

## nginx

### https
To make our server be http-secure we have to add ssl certificates

#### Certificates
In nginx/
```
mkcert amaria-d.42.fr
```

Once again, I'm having port problems, so we'll forward port 4330 on host to 443 on guest
We also have to open the port in the docker-compose

## wordpress + php-pfm
### php-pfm
gonna have to change nginx config
[https://stackoverflow.com/questions/44706951/nginx-to-serve-php-files-from-a-different-server]

### wordpress

For the dependencies
[https://ubuntu.com/tutorials/install-and-configure-wordpress#2-install-dependencies]

The install
[https://medium.com/employbl/create-a-wordpress-site-from-the-command-line-and-run-it-locally-13db3f996519]


## internal docker networking
check out [https://docs.docker.com/compose/networking/]

It seems pretty simple actually

## Env
Found this [https://docs.docker.com/compose/compose-file/05-services/#env_file]
Keeping it here to check out later