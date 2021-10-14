FROM golang:1.17-alpine3.14

RUN apk update && apk add --no-cache curl libwebp git gcc g++
WORKDIR /go/src/github.com/gohugoio
RUN git clone https://github.com/gohugoio/hugo
WORKDIR /go/src/github.com/gohugoio/hugo
RUN CGO_ENABLED=1 go install --tags extended
