FROM ruby:2.4
MAINTAINER Derich Pacheco <carlosderich@gmail.com>

WORKDIR /server

RUN apt-get update && \
    apt-get install -yqq netcat

ADD . /server
RUN bundle install

EXPOSE 8125

CMD bundle exec ruby server.rb
