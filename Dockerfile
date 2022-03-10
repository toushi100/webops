FROM ruby:3.0.3-alpine


RUN apk add --update --virtual \  
default-libmysqlclient-dev \
build-base \ 
libxslt-dev \ 
nodejs \ 
yarn \ 
libffi-dev \ 
libffi \
libc-dev \ 
linux-headers \ 
mariadb-dev \
mariadb-client \
readline-dev \ 
file \ 
git \ 
redis \ 
mysql \ 
tzdata \
&& rm -rf /var/cache/apk/* 

WORKDIR /app
COPY . /app/

ENV BUNDLE_VERSION 2.3.4
ENV BUNDLE_PATH /gems
RUN yarn install
RUN bundle install

ENTRYPOINT ["bin/rails"]
CMD ["s"]
EXPOSE 3000


