ARG JAVA_VERSION=26
ARG KEYCLOAK_VERSION=26.7.4

FROM ismailmarmoush/docker-java:${JAVA_VERSION}

ARG KEYCLOAK_VERSION

RUN curl -fsSL \
      "https://github.com/keycloak/keycloak/releases/download/${KEYCLOAK_VERSION}/keycloak-${KEYCLOAK_VERSION}.tar.gz" \
      | tar -xz \
      && mv "keycloak-${KEYCLOAK_VERSION}" keycloak \
      && chown -R ubuntu:ubuntu keycloak

USER ubuntu:ubuntu

ENTRYPOINT ["keycloak/bin/kc.sh"]