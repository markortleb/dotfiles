.PHONY: install-dependencies
install-dependencies:
	curl -sS https://starship.rs/install.sh | sh


.PHONY: deploy
deploy:
	bash deploy.sh