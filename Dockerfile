# Dockerfile for kcptun

FROM resin/armv7hf-debian-qemu

MAINTAINER lowid <lowid@gmail.com>

RUN [ "cross-build-start" ]

ENV KCPTUN_VERSION 20170525
ENV KCPTUN_FILE kcptun-linux-arm-${KCPTUN_VERSION}.tar.gz
ENV KCPTUN_URL https://github.com/xtaci/kcptun/releases/download/v${KCPTUN_VERSION}/${KCPTUN_FILE}

RUN apt-get update && apt-get install -y \
        curl \
        && rm -rf /var/lib/apt/lists/*

RUN set -xe \
    && curl -sSL ${KCPTUN_URL} | tar xz -C /usr/local/bin

RUN [ "cross-build-start" ]

ENTRYPOINT ["server_linux_amd64"]
CMD ["--help"]
