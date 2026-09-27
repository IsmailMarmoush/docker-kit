-include .env

REGISTRY := ismailmarmoush

build-java:
	docker build \
		--build-arg JAVA_VERSION=$(JAVA_VERSION) \
		-t $(REGISTRY)/docker-java:$(JAVA_VERSION) \
		-t $(REGISTRY)/docker-java:latest \
		-f java.dockerfile .

build-keycloak:
	docker build \
		--build-arg JAVA_VERSION=$(JAVA_VERSION) \
		-t $(REGISTRY)/docker-keycloak:$(JAVA_VERSION) \
		-t $(REGISTRY)/docker-keycloak:latest \
		-f keycloak.dockerfile .

push-java:
	docker push $(REGISTRY)/docker-java:$(JAVA_VERSION)
	docker push $(REGISTRY)/docker-java:latest

push-keycloak:
	docker push $(REGISTRY)/docker-keycloak:$(JAVA_VERSION)
	docker push $(REGISTRY)/docker-keycloak:latest