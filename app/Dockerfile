FROM ruby:3.3-alpine

WORKDIR /app

RUN apk add --no-cache \
  build-base \
  ruby-dev

RUN gem install bundler

COPY Gemfile ./
RUN bundle install

COPY app.rb .

EXPOSE 4567

CMD ["bundle", "exec", "ruby", "app.rb"]
