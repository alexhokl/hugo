GIT_TAG := v0.105.0
image:
	docker build --build-arg GIT_TAG=$(GIT_TAG) -t docker.io/alexhokl/hugo:$(GIT_TAG) .
push:
	docker push docker.io/alexhokl/hugo:$(GIT_TAG)
