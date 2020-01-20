.PHONY: build-docker build-docker-aws clean run

VERSION = 3.8.0

build-docker-aws:
	docker build --no-cache -t /grid/nexus:$(VERSION) .
	docker push /grid/nexus:$(VERSION)

clean:
	docker rmi /grid/nexus:$(VERSION) || true

run:
	docker run -d --rm -e --name nexus -p 8081:8081 /grid/nexus:$(VERSION)
