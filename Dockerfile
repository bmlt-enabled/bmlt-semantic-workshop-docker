FROM ubuntu:16.04

RUN apt-get update \
  && apt-get install -yqq apache2 php libapache2-mod-php git

WORKDIR /opt

ARG BMLT_SEMANTIC_WORKSHOP_VERSION=1.3.2

RUN git clone https://bitbucket.org/bmlt/bmlt-semantic-workshop.git \
  && cd bmlt-semantic-workshop \
  && git checkout -b ${BMLT_SEMANTIC_WORKSHOP_VERSION} ${BMLT_SEMANTIC_WORKSHOP_VERSION} \
  && mv ./* /var/www/html/ \
  && chown -R www-data: /var/www/html \
  && echo "nameserver 8.8.8.8" >> /etc/resolv.conf

CMD ["apachectl", "-D", "FOREGROUND"]
