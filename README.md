# Docker Kit

A collection of Debian-based Docker images for Java applications and infrastructure.

Images are published under the `ismailmarmoush` Docker Hub namespace.

## Images

| Image                            | Description                     |
|----------------------------------|---------------------------------|
| `ismailmarmoush/docker-java`     | Debian Trixie + Eclipse Temurin |
| `ismailmarmoush/docker-keycloak` | Keycloak built on `docker-java` |

> **Architecture:** Published images currently support **x86-64 (`amd64`) only**. ARM64 (`aarch64`) is not yet
> supported. ARM users must clone this repository and build the images locally for their architecture.

---

# User Guide

## Java

Pull the Java image:

```bash
docker pull ismailmarmoush/docker-java:27-35
```

Check the Java version:

```bash
docker run --rm ismailmarmoush/docker-java:27-35 java -version
```

Start JShell:

```bash
docker run --rm -it ismailmarmoush/docker-java:27-35 jshell
```

## Keycloak

Pull the Keycloak image:

```bash
docker pull ismailmarmoush/docker-keycloak:26.7.4

```

Run Keycloak in development mode:

```bash
docker run --rm -p 8080:8080 ismailmarmoush/docker-keycloak:26.7.4 start-dev
```

For production deployments, configure Keycloak using its supported environment variables, configuration files, database,
TLS, hostname, and deployment settings.

---

# Developer Guide

## Configuration

Version configuration is kept in `.env`:

```dotenv
TEMURIN_VERSION=27
TEMURIN_BUILD=35
KEYCLOAK_VERSION=26.7.4
```

`TEMURIN_VERSION` and `TEMURIN_BUILD` identify the exact Temurin release used by `docker-java`.

`KEYCLOAK_VERSION` identifies the Keycloak release installed in `docker-keycloak`.

## Building

Build the Java image:

```bash
make build-java
```

Build the Keycloak image:

```bash
make build-keycloak
```

Build `docker-java` before `docker-keycloak` when the required Java image is not already available locally or in the
registry.

## Adding an image

Create a directory for the new image:

```text
new-image/
├── Dockerfile
└── install-new-image.sh
```

Add the corresponding build and push targets to the `Makefile`.

Keep image-specific installation logic inside the image's directory. Shared scripts should only be introduced when the
logic is genuinely common to multiple images.
