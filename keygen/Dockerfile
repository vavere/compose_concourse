FROM bash:5

RUN apk add --no-cache openssl openssh-keygen

WORKDIR /app

RUN mkdir scripts

COPY scripts/certs.sh scripts

VOLUME /app/keys/web
VOLUME /app/keys/worker

CMD bash scripts/certs.sh
