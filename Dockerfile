FROM golang:1.10.3-alpine3.8 AS build-essential
MAINTAINER Max Focker <max.focker.shih@gmail.com>
ENV VERSION v3.4.0

RUN apk add --no-cache curl bash git
RUN go get -v -d github.com/golang-migrate/migrate/cli \
    && go get -v -d github.com/gocql/gocql
WORKDIR /go/src/github.com/golang-migrate/migrate
RUN git checkout ${VERSION} \
    && go build -tags 'cassandra' -o ./bin/migrate ./cli

FROM alpine:3.8
COPY --from=build-essential /go/src/github.com/golang-migrate/migrate/bin/migrate /usr/local/bin/migrate
ENTRYPOINT ["migrate"]