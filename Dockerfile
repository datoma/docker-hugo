FROM golang:alpine3.11

LABEL maintainer='Michael Hoffmann - https://github.com/datoma'

ENV HUGO_VERSION 0.70.0
ENV HUGO_PACKAGE hugo_${HUGO_VERSION}_linux-64bit.tar.gz
ENV HUGO_DIR /usr/hugo
ENV HUGO_URL example.de
ENV HUGO_PORT 1313
ENV HUGO_APPEND_PORT false
ENV HUGO_BIND 0.0.0.0
ENV HUGO_OPTIONS --navigateToChanged --templateMetrics --buildDrafts

ADD https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_PACKAGE} /tmp/
RUN apk update && apk --no-cache add py-pygments bash git asciidoc \
    && tar xzf /tmp/${HUGO_PACKAGE} -C /tmp \
    && mv /tmp/hugo /usr/local/bin/ \
    && mkdir -p ${HUGO_DIR} \
    && apk del curl \
    && rm -rf /tmp/* \
    && rm -rf /var/cache/apk/*

VOLUME ${HUGO_DIR}
WORKDIR ${HUGO_DIR}
EXPOSE ${HUGO_PORT}

CMD hugo server -b ${HUGO_URL} -p ${HUGO_PORT} --bind ${HUGO_BIND} ${HUGO_OPTIONS}
