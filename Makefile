.PHONY: run

# git rev-parse HEAD (fetch 6character)
#
current_dir = $(shell pwd)
commit = $(shell git rev-parse HEAD | head -c 6)
image = "olblak/repo-proxy"

build: 
	docker build -t $(image):$(commit) .

run: build
	docker run -p 80:80 --rm --name repo.azure.jenkins.io $(image):$(commit)

publish: 
	docker push "$(image):$(commit)"
