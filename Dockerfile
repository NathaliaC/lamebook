FROM ruby:3.2.0

RUN apt-get update && apt-get install -qq -y --no-install-recommends \
    build-essential libpq-dev git-all nano vim imagemagick \
    tzdata nodejs yarn


ENV INSTALL_PATH /lamebook

RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

ENV BUNDLE_PATH /gems

COPY . .