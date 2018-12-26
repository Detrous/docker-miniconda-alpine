IMAGE_NAME = detrous/alpine-miniconda
VERSION = latest

image:
	docker build -t $(IMAGE_NAME):$(VERSION) -t $(IMAGE_NAME):latest --no-cache .

push:
	docker push $(IMAGE_NAME):$(VERSION)
	docker push $(IMAGE_NAME):latest

all: image push
