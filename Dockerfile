FROM python:3.7-alpine

ENV PYTHONUNBUFFERED 1

WORKDIR /app
COPY ./requirements.txt ./

RUN apk add --no-cache python3-dev libstdc++ && \
    apk add --no-cache --update-cache gcc gfortran build-base wget freetype-dev libpng-dev openblas-dev &&\
    apk add --no-cache --virtual .build-deps g++ && \
    ln -s /usr/include/locale.h /usr/include/xlocale.h && \
    pip install --no-cache-dir -r /app/requirements.txt && \
    apk del .build-deps
