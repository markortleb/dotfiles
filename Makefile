MODULES := bash git ideavim nvim profile tmux zsh

.PHONY: deploy-module
deploy-module:
	@if [ -z "$(module)" ]; then \
		echo "Missing module=<name>"; \
		exit 2; \
	fi
	@if [ ! -d "$(module)" ]; then \
		echo "Unknown module: $(module)"; \
		exit 2; \
	fi
	@if [ -f "$(module)/Makefile" ]; then \
		$(MAKE) -C "$(module)" deploy; \
	else \
		bash "$(module)/deploy.sh"; \
	fi


.PHONY: install-module
install-module:
	@if [ -z "$(module)" ]; then \
		echo "Missing module=<name>"; \
		exit 2; \
	fi
	@if [ ! -d "$(module)" ]; then \
		echo "Unknown module: $(module)"; \
		exit 2; \
	fi
	@if [ -f "$(module)/Makefile" ]; then \
		$(MAKE) -C "$(module)" install; \
	elif [ -f "$(module)/install.sh" ]; then \
		bash "$(module)/install.sh"; \
	else \
		echo "Skipping install for $(module)"; \
	fi


.PHONY: deploy
deploy:
	@if [ ! -f "$(CURDIR)/.dotfiles.env" ]; then \
		echo "Missing $(CURDIR)/.dotfiles.env"; \
		exit 2; \
	fi
	@echo "Create symbolic link for $$HOME/.dotfiles.env."
	@ln -sfn "$(CURDIR)/.dotfiles.env" "$$HOME/.dotfiles.env"
	@. "$$HOME/.dotfiles.env"; \
	if [ -z "$$DOTFILES_DIR" ]; then \
		echo "DOTFILES_DIR is not set in $$HOME/.dotfiles.env"; \
		exit 2; \
	fi; \
	export DOTFILES_DIR="$$DOTFILES_DIR"; \
	if [ -n "$(module)" ]; then \
		$(MAKE) deploy-module module="$(module)"; \
	else \
		for m in $(MODULES); do \
			$(MAKE) deploy-module module="$$m"; \
		done; \
	fi


.PHONY: install
install:
	@if [ -n "$(module)" ]; then \
		$(MAKE) install-module module="$(module)"; \
	else \
		for m in $(MODULES); do \
			$(MAKE) install-module module="$$m"; \
		done; \
	fi