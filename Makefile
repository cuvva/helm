help: ## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

lint-debug: ## show the failing rendered template
	helm template example ./service --values test_values.yaml --debug

lint: ## render the template checking for errors
	helm template example ./service --values test_values.yaml

build: ## build
	helm package ./service
	helm repo index . --url https://julesjcraske.github.io/helm-repo