FROM alpine

RUN apk add --no-cache openssl openssh-keygen

WORKDIR /app

RUN mkdir scripts

COPY scripts/certs.sh scripts

VOLUME /app/keys/web
VOLUME /app/keys/worker

CMD sh scripts/certs.sh
