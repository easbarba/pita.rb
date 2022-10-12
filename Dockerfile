FROM docker.io/library/ruby:3.0.4-alpine

MAINTAINER EAS Barbosa <easbarba@outlook.com>

ENV SYSTEM_PACKAGES='build-base curl' \
    PROJECT_PACKAGES='tzdata postgresql-dev imagemagick' \
    FRONT_PACKAGES='nodejs yarn'

RUN apk add --update $SYSTEM_PACKAGES $PROJECT_PACKAGES $FRONT_PACKAGES

WORKDIR /app

# Rails dependencies
RUN gem install bundler childprocess # webdriver dep
COPY Gemfile Gemfile.lock ./
RUN bundle update && bundle install

# All files
COPY . ./

ENTRYPOINT ["./docker-entrypoint.sh"]
CMD ["bin/rails", "s", "-b", "0.0.0.0"]
