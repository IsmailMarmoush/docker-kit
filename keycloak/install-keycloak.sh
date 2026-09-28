#!/bin/sh
set -eu

: "${KEYCLOAK_VERSION:?KEYCLOAK_VERSION is required}"

apt-get update
apt-get install -y --no-install-recommends ca-certificates curl

URL="https://github.com/keycloak/keycloak/releases/download/${KEYCLOAK_VERSION}/keycloak-${KEYCLOAK_VERSION}.tar.gz"

curl --fail --location --silent --show-error "$URL" | tar -xz

mv "keycloak-${KEYCLOAK_VERSION}" /opt/keycloak

useradd --system --create-home --home-dir /home/keycloak --shell /usr/sbin/nologin keycloak

chown -R keycloak:keycloak /opt/keycloak

rm -rf /var/lib/apt/lists/*