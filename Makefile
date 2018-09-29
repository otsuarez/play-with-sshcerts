all: help

.PHONY: up
up: ## start containers
	docker-compose up -d
	docker-compose exec server1 bash

.PHONY: 1
1: ## attach to server1's container
	docker-compose exec server1 bash

.PHONY: 2
2: ## attach to server2's container
	docker-compose exec server2 bash

.PHONY: clean
clean: ## clean docker images and files
	docker-compose down
	rm  ssh-ca/*

.PHONY: run
run: up 1 ## start both containers and connect to server1


.PHONY: help
help:
	@grep -E '^[0-9a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
