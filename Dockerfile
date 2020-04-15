FROM ruby:2.7.1
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /tips
WORKDIR /tips

COPY Gemfile Gemfile.lock ./

RUN bin/setup

COPY . /tips

ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]