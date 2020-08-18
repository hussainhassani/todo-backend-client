FROM nginx:latest

COPY . /usr/share/nginx/html
WORKDIR /usr/share/nginx/html

RUN apt-get update \
    && apt-get install dialog apt-utils -y \
    && apt-get install -y wget \
    && apt-get install -y gnupg2 \
    && apt-get install -y curl \
    && apt-get install -y git \
    && curl -sL https://deb.nodesource.com/setup_14.x | bash \
    && apt-get install -yq nodejs \
    && npm install -g grunt-cli \
    && npm install grunt --save-dev \
    && npm install  \
    && grunt

EXPOSE 8989

ENTRYPOINT ["nginx", "-g", "daemon off;"]