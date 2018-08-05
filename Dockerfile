FROM python:3.7-alpine3.8
MAINTAINER Max Focker <max.focker.shih@gmail.com>

RUN pip install cassandra-migrate
ENTRYPOINT ["cassandra-migrate"]