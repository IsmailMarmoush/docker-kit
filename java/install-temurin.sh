#!/bin/sh
set -eu

: "${TEMURIN_VERSION:?TEMURIN_VERSION is required}"
: "${TEMURIN_BUILD:?TEMURIN_BUILD is required}"
: "${TARGETARCH:?TARGETARCH is required}"

case "$TARGETARCH" in
    amd64)
        ARCH=x64
        ;;
    arm64)
        ARCH=aarch64
        ;;
    *)
        echo "Unsupported architecture: $TARGETARCH" >&2
        exit 1
        ;;
esac

JAVA_HOME=/opt/java/openjdk

TEMURIN_RELEASE="jdk-${TEMURIN_VERSION}%2B${TEMURIN_BUILD}"
TEMURIN_ARCHIVE="OpenJDK${TEMURIN_VERSION}U-jdk_${ARCH}_linux_hotspot_${TEMURIN_VERSION}_${TEMURIN_BUILD}.tar.gz"

URL="https://github.com/adoptium/temurin${TEMURIN_VERSION}-binaries/releases/download/${TEMURIN_RELEASE}/${TEMURIN_ARCHIVE}"

apt-get update
apt-get install -y --no-install-recommends ca-certificates curl

mkdir -p "$JAVA_HOME"

curl --fail --location --silent --show-error "$URL" | tar -xz --strip-components=1 -C "$JAVA_HOME"

apt-get purge -y --auto-remove curl
rm -rf /var/lib/apt/lists/*

"$JAVA_HOME/bin/java" -version