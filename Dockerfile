FROM ruby:3.1.2-alpine3.16

LABEL version="1.0.0" maintainer="antculap@gmail.com"

RUN adduser -D antculap
RUN apk update &&\
    apk add --no-cache ruby \
    ruby-bundler \
    ruby-rake \
    --update npm \
    curl \
    --virtual build-dependencies \
    build-base

ENV GEM_HOME /usr/local/bundle
ENV BUNDLE_APP_CONFIG="$GEM_HOME"
ENV PATH $GEM_HOME/bin:$PATH
RUN mkdir -p "$GEM_HOME" && chmod 777 "$GEM_HOME"

COPY Gemfile Gemfile.lock /home/antculap/
RUN chmod a+w /home/antculap/Gemfile.lock
RUN chmod a+w /home/antculap

WORKDIR /home/antculap/
RUN bundle install

WORKDIR /testdir

CMD ["rake", "test"]