# Based on official nginx Dockerfile
# https://github.com/nginxinc/docker-nginx/blob/master/Dockerfile

FROM  resin/rpi-raspbian:wheezy

RUN \
  apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y nginx && \
  ln -sf /dev/stdout /var/log/nginx/access.log && \
  ln -sf /dev/stderr /var/log/nginx/error.log

COPY ./ /usr/share/nginx/html

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
