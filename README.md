# Docker Kit

[![Build](https://github.com/IsmailMarmoush/docker-kit/actions/workflows/publish.yaml/badge.svg)](https://github.com/IsmailMarmoush/docker-kit/actions/workflows/publish.yaml)
[![License](https://img.shields.io/github/license/IsmailMarmoush/docker-kit)](https://github.com/IsmailMarmoush/docker-kit/blob/master/LICENSE)
[![Last Commit](https://img.shields.io/github/last-commit/IsmailMarmoush/docker-kit)](https://github.com/IsmailMarmoush/docker-kit/commits/master)

| Image             | Version                                                                                                                                                     | Pulls                                                                                                                                                   |
|-------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------|
| `docker-java`     | [![Docker Java](https://img.shields.io/docker/v/ismailmarmoush/docker-java?label=version)](https://hub.docker.com/r/ismailmarmoush/docker-java)             | [![Docker Java Pulls](https://img.shields.io/docker/pulls/ismailmarmoush/docker-java)](https://hub.docker.com/r/ismailmarmoush/docker-java)             |
| `docker-keycloak` | [![Docker Keycloak](https://img.shields.io/docker/v/ismailmarmoush/docker-keycloak?label=version)](https://hub.docker.com/r/ismailmarmoush/docker-keycloak) | [![Docker Keycloak Pulls](https://img.shields.io/docker/pulls/ismailmarmoush/docker-keycloak)](https://hub.docker.com/r/ismailmarmoush/docker-keycloak) |
| `docker-kafka`    | [![Docker Kafka](https://img.shields.io/docker/v/ismailmarmoush/docker-kafka?label=version)](https://hub.docker.com/r/ismailmarmoush/docker-kafka)          | [![Docker Kafka Pulls](https://img.shields.io/docker/pulls/ismailmarmoush/docker-kafka)](https://hub.docker.com/r/ismailmarmoush/docker-kafka)          |
| `docker-ansible`  | [![Docker Ansible](https://img.shields.io/docker/v/ismailmarmoush/docker-ansible?label=version)](https://hub.docker.com/r/ismailmarmoush/docker-ansible)    | [![Docker Ansible Pulls](https://img.shields.io/docker/pulls/ismailmarmoush/docker-ansible)](https://hub.docker.com/r/ismailmarmoush/docker-ansible)    |

A collection of Debian-based Docker images for Java applications and infrastructure.

Images are published under the `ismailmarmoush` Docker Hub namespace.

## Images

| Image             | Description                         |
|-------------------|-------------------------------------|
| `docker-java`     | Debian Trixie + Eclipse Temurin     |
| `docker-keycloak` | Keycloak built on `docker-java`     |
| `docker-kafka`    | Apache Kafka built on `docker-java` |
| `docker-ansible`  | Debian Trixie + Ansible             |

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