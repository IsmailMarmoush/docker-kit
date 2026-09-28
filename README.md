# Docker Kit

A collection of Debian-based Docker images for Java applications and infrastructure.

Images are published under the `ismailmarmoush` Docker Hub namespace.

## Images

| Image                            | Description                         |
|----------------------------------|-------------------------------------|
| `ismailmarmoush/docker-java`     | Debian Trixie + Eclipse Temurin     |
| `ismailmarmoush/docker-keycloak` | Keycloak built on `docker-java`     |
| `ismailmarmoush/docker-kafka`    | Apache Kafka built on `docker-java` |
| `ismailmarmoush/ansible`         | Debian Trixie + Ansible             |

> **Architecture:** Published images currently support **x86-64 (`amd64`) only**. ARM64 (`aarch64`) is not yet
> supported. ARM users must build the images locally.

---

# User Guide

## Docker Images

Images can be pulled directly from Docker Hub:

```bash
docker pull ismailmarmoush/<image>:<version>
```

## Makefile

The Makefile can be used from inside or outside the `docker-kit` repository.

From inside `docker-kit`:

```bash
cd docker-kit
make <target>
```

From another project:

```bash
cd <project>
make -f /path/to/docker-kit/Makefile <target>
```

When invoked from another project, targets that operate on the current project use that project's directory.

Build an image:

```bash
make build-<tool>
```

Push an image:

```bash
make push-<tool>
```

Run an image:

```bash
make run-<tool>
```

Additional targets are available where required by a specific image.

---

# Developer Guide

## Configuration

Image versions are defined in `.env`.

## Adding an Image

Create a directory for the image containing its Dockerfile and installation scripts.

Add the image's version configuration and corresponding Makefile targets.

Keep image-specific installation logic inside the image's directory.