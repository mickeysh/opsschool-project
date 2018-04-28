FROM ruby:2.4-alpine3.6
RUN apk add --update \
    build-base \
    mariadb-dev \
    nodejs \
    tzdata \
    imagemagick
ADD . /spree
ENV MYSQL_DATABASE_HOST='' 
ENV MYSQL_DATABASE_USER_NAME='' 
ENV MYSQL_DATABASE_PASSWORD='' 
ENV MYSQL_DATABASE_NAME=''
WORKDIR /spree
RUN gem install bundler
RUN bundle install
EXPOSE 3000
ENTRYPOINT rails server