FROM node:14.17.0-alpine

ENV LANG=C.UTF-8 \
  TZ=Asia/Tokyo

WORKDIR /fe
# COPY Gemfile /be/Gemfile
# COPY Gemfile.lock /be/Gemfile.lock

RUN apk update && \
  apk upgrade && \
  npm install -g npm

COPY . /fe

EXPOSE 8080
