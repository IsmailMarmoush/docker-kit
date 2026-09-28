FROM debian:trixie-slim

ARG TEMURIN_VERSION
ARG TEMURIN_BUILD
ARG TARGETARCH

ENV TEMURIN_VERSION=${TEMURIN_VERSION}
ENV TEMURIN_BUILD=${TEMURIN_BUILD}

COPY install-temurin.sh /usr/local/bin/install-temurin.sh

RUN chmod +x /usr/local/bin/install-temurin.sh \
    && install-temurin.sh \
    && rm /usr/local/bin/install-temurin.sh

ENV JAVA_HOME=/opt/java/openjdk
ENV PATH="${JAVA_HOME}/bin:${PATH}"