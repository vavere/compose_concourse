FROM bash:5

RUN mkdir -p /config/{consul,vault}

WORKDIR /config

COPY config_consul/consul.json consul.json
COPY config_vault/vault.json vault.json

RUN chmod 644 *

VOLUME /config/consul
VOLUME /config/vault

CMD cp /config/consul.json /config/consul/ && cp /config/vault.json /config/vault
