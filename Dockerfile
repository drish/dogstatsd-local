FROM ruby:2.3-jessie
MAINTAINER Derich Pacheco <carlosderich@gmail.com>

WORKDIR /server

RUN apt-get update && \
    apt-get install -yqq netcat

ADD . /server
RUN bundle install

EXPOSE 8125

CMD ["./bin/server"]
