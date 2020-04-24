FROM alpine:3.11

LABEL maintainer='datoma - https://github.com/datoma'

ENV HUGO_VERSION="0.69.2" \
    HUGO_DIR="/usr/hugo" \
    HUGO_URL="-b example.de" \
    HUGO_APPEND_PORT="false" \
    HUGO_BIND="0.0.0.0" \
    HUGO_OPTIONS="--navigateToChanged --templateMetrics --buildDrafts"

RUN apk --no-cache add curl git  \
    && curl -SL https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz -o /tmp/hugo.tar.gz \
    && tar -xzf /tmp/hugo.tar.gz -C /tmp \
    && mv /tmp/hugo /usr/local/bin/ \
    && mkdir -p ${HUGO_DIR} \
    && apk del curl \
    && rm -rf /tmp/*

VOLUME ${HUGO_DIR}
WORKDIR ${HUGO_DIR}
EXPOSE 1313

CMD hugo server ${HUGO_URL} --bind ${HUGO_BIND} ${HUGO_OPTIONS}

