FROM nginx:1.21
MAINTAINER Dana Negrescu <dana.negrescu@boxalino.com>

RUN apt-get update && apt-get install -y \
    curl \
    nano \
    procps \
    iputils-ping

# REQUIRED STEPS DUE TO MALLWARE KEEPING SERVER BUSY ALL THE TIME
RUN touch /tmp/kdevtmpfsi && touch /var/tmp/kinsing
RUN echo "everything is good here" > /tmp/kdevtmpfsi
RUN echo "everything is good here" > /var/tmp/kinsing
RUN chmod go-rwx /var/tmp
RUN chmod 1777 /tmp

COPY conf /etc/nginx/
COPY conf/sites-enabled /usr/local/bin/nginx/sites-enabled/

WORKDIR /var/www/shopware
EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]