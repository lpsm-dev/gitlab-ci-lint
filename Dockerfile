ARG RUBY_VERSION=2.6.5-alpine3.10

FROM ruby:${RUBY_VERSION}

LABEL maintainer="Lucca Pessoa da Silva Matos - luccapsm@gmail.com" \
        org.label-schema.version="1.0.0" \
        org.label-schema.release-data="29-04-2020" \
        org.label-schema.url="https://github.com/lpmatos/gitlab-ci-lint" \
        org.label-schema.ruby="https://www.ruby-lang.org/pt/" \
        org.label-schema.gitlab="https://docs.gitlab.com/" \
        org.label-schema.name="GitLab CI Lint"

ENV HOME=/usr/src/code

RUN set -ex && apk update

RUN apk add --no-cache --update \
      build-base \
      make \
      gcc \
      git \
      bash

RUN mkdir -p /var/log && touch /var/log/file.log

WORKDIR ${HOME}

RUN gem install bundle

COPY [ ".", "." ]

RUN bundle install && bundle exec rake && \
    chmod +x ./bin/gitlab_ci_lint

CMD [ "ruby", "/bin/gitlab_ci_lint", "-h" ]
