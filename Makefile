DOCKER_KIT := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
-include $(DOCKER_KIT)/.env

REGISTRY := ismailmarmoush

ANSIBLE_SSH_DIR := $(HOME)/.ssh
ANSIBLE_WORKDIR := /workspace
ANSIBLE_PROJECT := $(CURDIR)

# -----------------------------------------------------------------------------
# Build
# -----------------------------------------------------------------------------

build-java:
	docker build \
		--build-arg TEMURIN_VERSION=$(TEMURIN_VERSION) \
		--build-arg TEMURIN_BUILD=$(TEMURIN_BUILD) \
		-t $(REGISTRY)/docker-java:$(TEMURIN_VERSION)-$(TEMURIN_BUILD) \
		-t $(REGISTRY)/docker-java:latest \
		-f $(DOCKER_KIT)/java/Dockerfile \
		$(DOCKER_KIT)/java

build-keycloak:
	docker build \
		--build-arg TEMURIN_VERSION=$(TEMURIN_VERSION) \
		--build-arg TEMURIN_BUILD=$(TEMURIN_BUILD) \
		--build-arg KEYCLOAK_VERSION=$(KEYCLOAK_VERSION) \
		-t $(REGISTRY)/docker-keycloak:$(KEYCLOAK_VERSION) \
		-t $(REGISTRY)/docker-keycloak:latest \
		-f $(DOCKER_KIT)/keycloak/Dockerfile \
		$(DOCKER_KIT)/keycloak

build-kafka:
	docker build \
		--build-arg KAFKA_VERSION=$(KAFKA_VERSION) \
		-t $(REGISTRY)/docker-kafka:$(KAFKA_VERSION) \
		-t $(REGISTRY)/docker-kafka:latest \
		-f $(DOCKER_KIT)/kafka/Dockerfile \
		$(DOCKER_KIT)/kafka

build-ansible:
	docker build \
		--build-arg ANSIBLE_VERSION=$(ANSIBLE_VERSION) \
		-t $(REGISTRY)/docker-ansible:$(ANSIBLE_VERSION) \
		-t $(REGISTRY)/docker-ansible:latest \
		-f $(DOCKER_KIT)/ansible/Dockerfile \
		$(DOCKER_KIT)/ansible

# -----------------------------------------------------------------------------
# Push
# -----------------------------------------------------------------------------

push-java:
	docker push $(REGISTRY)/docker-java:$(TEMURIN_VERSION)-$(TEMURIN_BUILD)
	docker push $(REGISTRY)/docker-java:latest

push-keycloak:
	docker push $(REGISTRY)/docker-keycloak:$(KEYCLOAK_VERSION)
	docker push $(REGISTRY)/docker-keycloak:latest

push-kafka:
	docker push $(REGISTRY)/docker-kafka:$(KAFKA_VERSION)
	docker push $(REGISTRY)/docker-kafka:latest

push-ansible:
	docker push $(REGISTRY)/docker-ansible:$(ANSIBLE_VERSION)
	docker push $(REGISTRY)/docker-ansible:latest

# -----------------------------------------------------------------------------
# Run
# -----------------------------------------------------------------------------

run-java-docker:
	docker run -it $(REGISTRY)/docker-java:latest

run-keycloak-docker:
	docker run -it $(REGISTRY)/docker-keycloak:latest

run-kafka-docker:
	docker run -it $(REGISTRY)/docker-kafka:latest

run-kafka-compose:
	docker compose -f $(DOCKER_KIT)/kafka/docker-compose.yaml up

# -----------------------------------------------------------------------------
# Ansible
# -----------------------------------------------------------------------------

define check-ansible-project
	@test -d "$(ANSIBLE_PROJECT)" || \
		(echo "ANSIBLE_PROJECT does not exist: $(ANSIBLE_PROJECT)" && exit 1)
endef

define run-ansible
	docker run --rm -it \
		-v "$(ANSIBLE_PROJECT):$(ANSIBLE_WORKDIR)" \
		-v "$(ANSIBLE_SSH_DIR):/root/.ssh:ro" \
		-w "$(ANSIBLE_WORKDIR)" \
		$(REGISTRY)/docker-ansible:$(ANSIBLE_VERSION) \
		$(1)
endef

run-ansible:
	$(check-ansible-project)
	$(call run-ansible,bash)

run-ansible-version:
	docker run --rm -it \
		$(REGISTRY)/docker-ansible:$(ANSIBLE_VERSION) \
		ansible --version

run-ansible-playbook:
	$(check-ansible-project)
	$(call run-ansible,ansible-playbook $(ARGS))