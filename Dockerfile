FROM ruby:2.7.4

RUN gem install reveal-ck

CMD reveal-ck serve -h 0.0.0.0 -p 10000
