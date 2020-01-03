.DEFAULT_GOAL:=help
SHELL:=/bin/bash

.PHONY: help deps clean build watch

help:  ## Display this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n\nTargets:\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST); printf "\n"

init: ## Initialize the app with
	rm -f go.mod
	rm -f go.sum
	go mod init $(path)


build: ## Build a clean version of the app
	go clean
	go build -o golosina

serve: ## Rebuild and Serve the project locally
	make build
	./golosina serve
