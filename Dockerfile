FROM alpine:3.8

RUN apk add py3-numpy py3-scipy && \
    apk add --no-cache --virtual build-deps musl-dev gcc g++ py-numpy-dev && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    ln -s /usr/bin/pip3 /usr/bin/pip && \
    pip install --no-cache-dir pandas && \
    apk del build-deps

ENV PYTHON_PIP_VERSION 18.0
RUN set -ex; \
	\
	wget -O get-pip.py 'https://bootstrap.pypa.io/get-pip.py'; \
	\
	python get-pip.py \
		--disable-pip-version-check \
		--no-cache-dir \
		"pip==$PYTHON_PIP_VERSION" \
	; \
	pip --version; \
	\
	find /usr/local -depth \
		\( \
			\( -type d -a \( -name test -o -name tests \) \) \
			-o \
			\( -type f -a \( -name '*.pyc' -o -name '*.pyo' \) \) \
		\) -exec rm -rf '{}' +; \
    rm -f get-pip.py
