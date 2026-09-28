#!/bin/sh
set -eu

: "${KAFKA_VERSION:?KAFKA_VERSION is required}"

KAFKA_HOME=/opt/kafka
KAFKA_SCALA_VERSION=2.13
KAFKA_FILE="kafka_${KAFKA_SCALA_VERSION}-${KAFKA_VERSION}"
URL="https://dlcdn.apache.org/kafka/${KAFKA_VERSION}/${KAFKA_FILE}.tgz"

apt-get update
apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    gettext-base

printf '%s\n' "Installing ${KAFKA_FILE}"

curl \
    --fail \
    --location \
    --silent \
    --show-error \
    "$URL" \
    | tar -xz -C /opt

apt-get purge -y --auto-remove curl
mv "/opt/${KAFKA_FILE}" "$KAFKA_HOME"

rm -rf /var/lib/apt/lists/*