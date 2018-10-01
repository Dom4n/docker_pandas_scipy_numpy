FROM alpine:3.8

RUN apk add py3-numpy py3-scipy && \
    apk add --no-cache --virtual build-deps musl-dev gcc g++ py-numpy-dev && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    ln -s /usr/bin/pip3 /usr/bin/pip && \
    pip install --no-cache-dir pandas && \
    apk del build-deps
