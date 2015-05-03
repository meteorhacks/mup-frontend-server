FROM debian
MAINTAINER Kadira Inc.

COPY lib/install-nginx.sh /tmp/install-nginx.sh
RUN bash /tmp/install-nginx.sh
RUN rm /tmp/install-nginx.sh

COPY lib /tmp/lib
RUN bash /tmp/lib/copy-files.sh

RUN chmod +x /verify.sh /start.sh 