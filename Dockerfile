FROM golang:1.12-alpine3.9 AS build

RUN apk update && apk add git
RUN go get -u github.com/gohugoio/hugo


FROM alpine:3.9

RUN apk update && apk upgrade && \
    apk add --no-cache curl libwebp
RUN addgroup -S app && adduser -S -G app app

ENV HOME=/home/app

WORKDIR $HOME/site

COPY --from=build /go/bin/hugo /usr/local/bin/

EXPOSE 1313

USER app

HEALTHCHECK --interval=15s --timeout=3s CMD \
  curl --fail http://localhost:1313 || exit 1

CMD ["hugo", "server", "--bind", "0.0.0.0"]
