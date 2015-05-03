FROM debian
MAINTAINER Kadira Inc.

COPY lib/install-nginx.sh /tmp/install-nginx.sh
RUN bash /tmp/install-nginx.sh
RUN rm /tmp/install-nginx.sh

COPY lib/nginx.conf /opt/nginx/config/ngnix.conf

COPY lib/start.sh /start.sh
COPY lib/verify.sh /verify.sh

RUN chmod +x /verify.sh /start.sh 