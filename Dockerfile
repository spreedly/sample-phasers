# syntax=docker/dockerfile:experimental
FROM ruby:2.6.6
LABEL maintainer="ops@spreedly.com"

ENV NODE_VERSION=8.x
RUN set -xe; \
	# Node.js repo
	curl -fsSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -; \
	echo "deb https://deb.nodesource.com/node_${NODE_VERSION} jessie main" | tee /etc/apt/sources.list.d/nodesource.list; \
	echo "deb-src https://deb.nodesource.com/node_${NODE_VERSION} jessie main" | tee -a /etc/apt/sources.list.d/nodesource.list; \
	# yarn repo
	curl -fsSL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -; \
	echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list; \
	apt-get update >/dev/null; \
	apt-get -y --no-install-recommends install >/dev/null \
		nodejs \
		yarn \
	;\
	apt-get clean; rm -rf /var/lib/apt/lists/*;

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
