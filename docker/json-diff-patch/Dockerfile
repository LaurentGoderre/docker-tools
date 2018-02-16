FROM node:8-alpine

ENV PATH=$PATH:/home/node/json-diff-patch

RUN npm install -g \
    jiff \
  && npm cache clean --force

USER node

RUN mkdir /home/node/json-diff-patch \
  && cd /home/node/json-diff-patch \
  && npm link jiff

COPY json* /home/node/json-diff-patch/

WORKDIR /home/node/app
