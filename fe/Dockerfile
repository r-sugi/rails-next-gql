FROM node:14.17.0-alpine

ENV LANG=C.UTF-8 \
  TZ=Asia/Tokyo

# ディレクトリ・ファイルの作成
WORKDIR /fe
COPY package.json /fe/package.json
COPY yarn.lock /fe/yarn.lock

RUN apk update && \
  apk upgrade && \
  npm install -g npm

COPY . /fe

EXPOSE 8080
