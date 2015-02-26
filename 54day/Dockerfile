FROM ubuntu

RUN apt-get update
RUN apt-get install -y nginx
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

ADD index.html /usr/share/nginx/html/index.html

EXPOSE 80

ENTRYPOINT /usr/sbin/nginx
