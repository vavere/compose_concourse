#!/usr/bin/env bash

if [[ ! -d "scripts" ]]; then
  echo "Execute this script in parent folder context (cd ..; scripts/certs.sh)."
  exit
fi

if [[ -d "keys" ]]; then
  echo -n "- Certificates already exists. Delete and re-create? (y/n): "
  read -r CONFIRMATION
  if [[ "${CONFIRMATION}" != "y" ]] && [[ "${CONFIRMATION}" != "Y" ]]; then
    echo "- Aborted"
    exit
  fi
  rm -rf keys/
fi

mkdir -p keys/web keys/worker

ssh-keygen -t rsa -f ./keys/web/tsa_host_key -N '' -q
ssh-keygen -t rsa -f ./keys/web/session_signing_key -N '' -q
ssh-keygen -t rsa -f ./keys/worker/worker_key -N '' -q

cp ./keys/worker/worker_key.pub ./keys/web/authorized_worker_keys
cp ./keys/web/tsa_host_key.pub ./keys/worker