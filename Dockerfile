FROM ruby:2.1.3

RUN mkdir -p /app
WORKDIR /app

ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
ADD vendor /app/vendor

RUN bundle install --system

RUN apt-get update && apt-get install -yq postgresql-client

ADD . /app

ENV RAILS_ENV development
ENV PORT 3000
EXPOSE 3000
