#!/bin/sh
set -eu

: "${OPENJDK_URL:?OPENJDK_URL is required}"

JAVA_HOME=/opt/java/openjdk

apt-get update
apt-get install -y --no-install-recommends ca-certificates curl

mkdir -p "$JAVA_HOME"

curl --fail --location --silent --show-error "$OPENJDK_URL" | tar -xz --strip-components=1 -C "$JAVA_HOME"

apt-get purge -y --auto-remove curl
rm -rf /var/lib/apt/lists/*

"$JAVA_HOME/bin/java" -version