image_name="vivitc/jenkins-workshop"
image_id=docker images -q vivitc/jenkins-workshop:latest
git_commit=git log --pretty=format:'%h' -n 1

docker-build:
	docker build -t $(image_name) .

docker-push:
        @docker tag $(image_id) vivitc/jenkins-workshop:$(git_commit)

