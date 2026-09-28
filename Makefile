-include .env

REGISTRY := ismailmarmoush

# -----------------------------------------------------------------------------
# Build
# -----------------------------------------------------------------------------

build-java:
	docker build \
		--build-arg TEMURIN_VERSION=$(TEMURIN_VERSION) \
		--build-arg TEMURIN_BUILD=$(TEMURIN_BUILD) \
		-t $(REGISTRY)/docker-java:$(TEMURIN_VERSION)-$(TEMURIN_BUILD) \
		-t $(REGISTRY)/docker-java:latest \
		-f java/Dockerfile \
		java

build-keycloak:
	docker build \
		--build-arg TEMURIN_VERSION=$(TEMURIN_VERSION) \
		--build-arg TEMURIN_BUILD=$(TEMURIN_BUILD) \
		--build-arg KEYCLOAK_VERSION=$(KEYCLOAK_VERSION) \
		-t $(REGISTRY)/docker-keycloak:$(KEYCLOAK_VERSION) \
		-t $(REGISTRY)/docker-keycloak:latest \
		-f keycloak/Dockerfile \
		keycloak

build-kafka:
	docker build \
		--build-arg KAFKA_VERSION=$(KAFKA_VERSION) \
		-t $(REGISTRY)/docker-kafka:$(KAFKA_VERSION) \
		-t $(REGISTRY)/docker-kafka:latest \
		-f kafka/Dockerfile \
		kafka

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

# -----------------------------------------------------------------------------
# Run
# -----------------------------------------------------------------------------

run-java-docker:
	docker run -it ismailmarmoush/docker-java:latest

run-keycloak-docker:
	docker run -it ismailmarmoush/docker-keycloak:latest

run-kafka-docker:
	docker run -it ismailmarmoush/docker-kafka:latest

run-kafka-compose:
	docker compose -f kafka/docker-compose.yaml up