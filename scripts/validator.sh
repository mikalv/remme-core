#!/usr/bin/env bash

sawadm keygen && \
sawtooth keygen key && \
sawset genesis -k /root/.sawtooth/keys/key.priv && \
sawadm genesis config-genesis.batch /genesis/batch/token-proposal.batch && \

sawtooth-validator -vv \
  --endpoint ${REMME_CURRENT_ENDPOINT_URL}:${REMME_CURRENT_ENDPOINT_PORT} \
  --bind component:tcp://eth0:${REMME_COMPONENT_PORT} \
  --bind network:tcp://eth0:${REMME_CURRENT_ENDPOINT_PORT} \
  -P static \
  --scheduler parallel