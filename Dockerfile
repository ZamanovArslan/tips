FROM ruby:2.5.8-alpine3.10

ENV APP_HOME /tips

RUN gem update --system && \
    gem install bundler -v 2.1.4 --force

RUN apk add --update --no-cache build-base \
	postgresql-dev \
	git \
	nodejs \
	less \
	curl \
	tzdata

RUN mkdir $APP_HOME

WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/

RUN bundle --version

RUN bundle check || bundle install

ADD . $APP_HOME

ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]