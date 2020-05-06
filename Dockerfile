FROM golang:alpine3.11

LABEL maintainer='Michael Hoffmann - https://github.com/datoma'

ENV HUGO_VERSION 0.69.2
ENV HUGO_PACKAGE hugo_${HUGO_VERSION}_linux-64bit.tar.gz
ENV HUGO_DIR="/usr/hugo" \
    HUGO_URL="-b example.de" \
    HUGO_APPEND_PORT="false" \
    HUGO_BIND="0.0.0.0" \
    HUGO_OPTIONS="--navigateToChanged --templateMetrics --buildDrafts"

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
EXPOSE 1313

CMD hugo server ${HUGO_URL} --bind ${HUGO_BIND} ${HUGO_OPTIONS}
