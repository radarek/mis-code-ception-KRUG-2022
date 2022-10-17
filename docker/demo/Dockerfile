FROM ruby:3.1.2

RUN apt-get update && \
    apt-get install -y less vim default-mysql-client && \
    rm -rf /var/lib/apt/lists/*

RUN gem install --no-doc pry

RUN echo "IRB.conf[:USE_AUTOCOMPLETE] = false" > ~/.irbrc

CMD ["bash"]
