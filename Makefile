DOCKER_REPO = docker.io/docker12345rekcod
IMAGE = echo-host:latest

build-image:
	docker build -t $(IMAGE) .

push-image:
	docker tag $(IMAGE) $(DOCKER_REPO)/$(IMAGE)
	docker push $(DOCKER_REPO)/$(IMAGE)