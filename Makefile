.PHONY: build run push
IMAGE=radius314/bmlt-semantic-workshop
VERSION=1.3.3

build:
	docker build . -t $(IMAGE):$(VERSION)

run:
	docker run -d -p 8081:80 $(IMAGE):$(VERSION)

push:
	docker push $(IMAGE):$(VERSION)
	docker tag $(IMAGE):$(VERSION) $(IMAGE):latest
	docker push $(IMAGE):latest
