# syntax=docker/dockerfile:1
FROM ruby:2.6.6
LABEL maintainer="ops@spreedly.com"

ENV NODE_VERSION=8.x
COPY script/install_node.sh /tmp
RUN /tmp/install_node.sh

RUN mkdir /srv/phasers
WORKDIR /srv/phasers

COPY Gemfile /srv/phasers/Gemfile
COPY Gemfile.lock /srv/phasers/Gemfile.lock
COPY vendor/ /srv/phasers/vendor
RUN gem install bundler
RUN bundle install --local
COPY ./ /srv/phasers

EXPOSE 3000/tcp
ENTRYPOINT ["/usr/local/bundle/bin/bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
