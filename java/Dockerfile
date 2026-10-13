FROM debian:trixie-slim

ARG OPENJDK_URL

ENV JAVA_HOME=/opt/java/openjdk
ENV PATH="${JAVA_HOME}/bin:${PATH}"

COPY install-openjdk.sh /usr/local/bin/install-openjdk.sh

RUN chmod +x /usr/local/bin/install-openjdk.sh \
    && install-openjdk.sh \
    && rm /usr/local/bin/install-openjdk.sh