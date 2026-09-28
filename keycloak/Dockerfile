ARG TEMURIN_VERSION=27
ARG TEMURIN_BUILD=35
ARG KEYCLOAK_VERSION=26.7.4

FROM ismailmarmoush/docker-java:${TEMURIN_VERSION}-${TEMURIN_BUILD}

ARG KEYCLOAK_VERSION

COPY install-keycloak.sh /usr/local/bin/install-keycloak.sh

RUN chmod +x /usr/local/bin/install-keycloak.sh \
    && install-keycloak.sh \
    && rm /usr/local/bin/install-keycloak.sh

USER keycloak

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]