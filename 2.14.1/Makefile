.PHONY: build-docker build-docker-aws clean run

VERSION = 2.14.1
build-docker:
	docker build --no-cache -t /grid/nexus:latest .
	docker tag /grid/nexus:latest /grid/nexus:$(VERSION)
	docker push /grid/nexus:latest
	docker push /grid/nexus:$(VERSION)

build-docker-aws:
	docker build --no-cache -t /grid/nexus:latest .
	docker tag /grid/nexus:latest /grid/nexus:$(VERSION)
	docker push /grid/nexus:latest
	docker push /grid/nexus:$(VERSION)

clean:
	docker rmi /grid/nexus:latest || true
	docker rmi /grid/nexus:$(VERSION) || true
	docker rmi /grid/nexus:latest || true
	docker rmi /grid/nexus:$(VERSION) || true

run:
	docker run -d --rm -e CLIENT_REPOSITORY_NAME="myCoolCompany" --name nexus -p 8081:8081 /grid/nexus:$(VERSION)
