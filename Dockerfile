FROM golang:1.19-alpine3.16

ARG GIT_TAG

RUN apk update && apk add --no-cache curl libwebp git gcc g++
WORKDIR /go/src/github.com/gohugoio
RUN git clone -b ${GIT_TAG} https://github.com/gohugoio/hugo
WORKDIR /go/src/github.com/gohugoio/hugo
RUN CGO_ENABLED=1 go install --tags extended
