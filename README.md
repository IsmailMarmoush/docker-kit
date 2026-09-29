# Docker Kit

[![Build](https://github.com/IsmailMarmoush/docker-kit/actions/workflows/publish.yaml/badge.svg)](https://github.com/IsmailMarmoush/docker-kit/actions/workflows/publish.yaml)
[![License](https://img.shields.io/github/license/IsmailMarmoush/docker-kit)](https://github.com/IsmailMarmoush/docker-kit/blob/master/LICENSE)
[![Last Commit](https://img.shields.io/github/last-commit/IsmailMarmoush/docker-kit)](https://github.com/IsmailMarmoush/docker-kit/commits/master)

A collection of Debian-based Docker images for Java applications and infrastructure.

Images are published under the `ismailmarmoush` Docker Hub namespace.

## Images

| Image             | Description                         | Version                                                                                                                                             | Pulls                                                                                                                                   |
|-------------------|-------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------|
| `docker-java`     | Debian Trixie + Eclipse Temurin     | [![Version](https://img.shields.io/docker/v/ismailmarmoush/docker-java?label=version)](https://hub.docker.com/r/ismailmarmoush/docker-java)         | [![Pulls](https://img.shields.io/docker/pulls/ismailmarmoush/docker-java)](https://hub.docker.com/r/ismailmarmoush/docker-java)         |
| `docker-keycloak` | Keycloak built on `docker-java`     | [![Version](https://img.shields.io/docker/v/ismailmarmoush/docker-keycloak?label=version)](https://hub.docker.com/r/ismailmarmoush/docker-keycloak) | [![Pulls](https://img.shields.io/docker/pulls/ismailmarmoush/docker-keycloak)](https://hub.docker.com/r/ismailmarmoush/docker-keycloak) |
| `docker-kafka`    | Apache Kafka built on `docker-java` | [![Version](https://img.shields.io/docker/v/ismailmarmoush/docker-kafka?label=version)](https://hub.docker.com/r/ismailmarmoush/docker-kafka)       | [![Pulls](https://img.shields.io/docker/pulls/ismailmarmoush/docker-kafka)](https://hub.docker.com/r/ismailmarmoush/docker-kafka)       |
| `docker-ansible`  | Debian Trixie + Ansible             | [![Version](https://img.shields.io/docker/v/ismailmarmoush/docker-ansible?label=version)](https://hub.docker.com/r/ismailmarmoush/docker-ansible)   | [![Pulls](https://img.shields.io/docker/pulls/ismailmarmoush/docker-ansible)](https://hub.docker.com/r/ismailmarmoush/docker-ansible)   |

> **Architecture:** Published images currently support **x86-64 (`amd64`) only**. ARM64 (`aarch64`) is not yet
> supported. ARM users must build the images locally.

---

# Motivation

This repository brings the Docker images I use for Java applications and infrastructure into a single place, making them
easier to maintain, version, and document.

The images are built around a few simple goals:

- **`Debian-<version>-slim`** — A lightweight, battle-tested base that works well for development, testing, debugging,
  and production
  environments.
- **`docker-java`** — A simple Java development and runtime environment based on Debian and Eclipse Temurin, convenient
  for running applications or interactive work with tools such as `bash` and `jshell`.
- **`docker-keycloak`** — A Keycloak image that reuses the same Java base, and future straightforward best practiced
  configurations
- **`docker-kafka`** — A KRaft-based Kafka image with variable interpolation, configurable templates, and ready-to-use
  singleton and high-availability configurations. The goal is to make running a Kafka cluster straightforward.
- **`docker-ansible`** — Run Ansible in a container without installing it on the host, providing a consistent and
  isolated environment for infrastructure automation.

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