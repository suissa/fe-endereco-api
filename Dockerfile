FROM python:3.6.4-alpine

ENV http_proxy http://15.85.195.199:8088
ENV https_proxy http://15.85.195.199:8088
ENV no_proxy conta,mysql

RUN apk add --no-cache build-base mariadb-client-libs

RUN apk add --no-cache --virtual .build-deps mariadb-dev git

ADD ./requirements.txt /requirements.txt

RUN pip install -r /requirements.txt

RUN apk del .build-deps

ADD ./docker/run.sh /run.sh
ADD ./src /app

WORKDIR /app

CMD ["/run.sh"]
