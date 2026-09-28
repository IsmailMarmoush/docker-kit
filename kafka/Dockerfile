ARG TEMURIN_VERSION=27
ARG TEMURIN_BUILD=35
ARG KAFKA_VERSION=4.3.1

FROM ismailmarmoush/docker-java:${TEMURIN_VERSION}-${TEMURIN_BUILD}

ARG KAFKA_VERSION

ENV KAFKA_HOME=/opt/kafka
ENV PATH="${KAFKA_HOME}/bin:${PATH}"

COPY install-kafka.sh /usr/local/bin/install-kafka.sh

RUN chmod +x /usr/local/bin/install-kafka.sh \
    && install-kafka.sh \
    && rm /usr/local/bin/install-kafka.sh

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
COPY default_tmpl/ /default_tmpl/

RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
