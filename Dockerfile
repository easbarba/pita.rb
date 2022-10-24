FROM docker.io/library/ruby:3.0.4-alpine

MAINTAINER EAS Barbosa <easbarba@outlook.com>

ENV SYSTEM_PACKAGES='build-base curl' \
    PROJECT_PACKAGES='tzdata postgresql-dev imagemagick' \
    FRONT_PACKAGES='nodejs yarn'

RUN apk add --update $SYSTEM_PACKAGES $PROJECT_PACKAGES $FRONT_PACKAGES

WORKDIR /app

# Rails dependencies
COPY Gemfile Gemfile.lock ./
ENV BUNDLE_PATH /gems
RUN gem install --no-document bundler childprocess
RUN bundle install

COPY package.json yarn.lock ./
RUN yarn install --check-files

# All files
COPY . .

ENTRYPOINT ["./docker-entrypoint.sh"]
CMD ["bin/rails", "s", "-b", "0.0.0.0"]
