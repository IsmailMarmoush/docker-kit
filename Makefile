-include .env

REGISTRY := ismailmarmoush

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

push-java:
	docker push $(REGISTRY)/docker-java:$(TEMURIN_VERSION)-$(TEMURIN_BUILD)
	docker push $(REGISTRY)/docker-java:latest

push-keycloak:
	docker push $(REGISTRY)/docker-keycloak:$(KEYCLOAK_VERSION)
	docker push $(REGISTRY)/docker-keycloak:latest