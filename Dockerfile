FROM nginx:latest

ARG DEBIAN_FRONTEND=noninteractive

COPY . /usr/share/nginx/html
WORKDIR /usr/share/nginx/html

RUN apt-get update \
    && apt-get install dialog apt-utils -y \
    && apt-get install -y wget \
    && apt-get install -y gnupg2 \
    && wget https://nginx.org/keys/nginx_signing.key -O - | apt-key add -

RUN printf '#!/bin/sh\nexit 0' > /usr/sbin/policy-rc.d
# RUN echo exit 0 > /usr/sbin/policy-rc.d

RUN apt-get install -y curl \
    && apt-get install -y git \
    && curl -sL https://deb.nodesource.com/setup_14.x | bash \
    && apt-get install -yq nodejs

RUN npm install -g grunt-cli \
    && npm install grunt --save-dev \
    && npm install  \
    && grunt


RUN apt-get install -y procps

ENTRYPOINT ["nginx", "-g", "daemon off;"]