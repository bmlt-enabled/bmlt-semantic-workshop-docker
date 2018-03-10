.PHONY: build run push
IMAGE=radius314/bmlt-semantic-workshop:1.3.3

build:
	docker build . -t $(IMAGE)

run:
	docker run -d -p 8081:80 $(IMAGE)

push:
	docker push $(IMAGE)
	
