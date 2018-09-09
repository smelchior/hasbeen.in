FROM ruby:2.4.1

ADD . /usr/src/app/

WORKDIR /usr/src/app/

RUN bundle install --path vendor/gems

EXPOSE 3000

CMD ["bundle", "exec", "puma"]