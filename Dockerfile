FROM node:16.19-alpine3.16
LABEL maintainer="www.mrdoc.fun"
ENV TZ=Asia/Shanghai \
    APPID= \
    SECRET= \
    BOTNAME=chatgpt \
    KEY= 
COPY . /app/

WORKDIR /app/

RUN  set -x \
    && apk add --no-cache tzdata \ 
    && npm install \
    && npm install @larksuiteoapi/node-sdk \
    && npm install axios \
    && npm install pm2@latest -g \
    && chmod +x /app/entrypoint.sh

ENTRYPOINT sh /app/entrypoint.sh
