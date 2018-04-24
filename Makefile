image_name = "vivitc/jenkins-workshop"
image_id = $(shell docker images -q $(image_name):latest)
git_commit = $(shell git log --pretty=format:'%h' -n 1)

docker-build:
	docker build -t $(image_name) .

docker-push:
	docker tag $(image_id) vivitc/jenkins-workshop:$(git_commit)
	docker push $(image_name)
