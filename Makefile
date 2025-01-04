.PHONY: help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help
VAULT_PASS_FILE = ./.vault-pass.txt

init-provision: ## Run ansible-playbook for initilization
	ansible-playbook ./site.yml -i ./inventories/hosts --tags init --vault-password-file $(VAULT_PASS_FILE)

provision: ## Run ansible-playbook
	ansible-playbook ./site.yml -i ./inventories/hosts --skip-tags init --vault-password-file $(VAULT_PASS_FILE)

# encrypt secrets file
encrypt-secrets:
	ansible-vault encrypt ./secrets/secrets.yml --vault-password-file $(VAULT_PASS_FILE)

decrypt-secrets:
	ansible-vault decrypt ./secrets/secrets.yml --vault-password-file $(VAULT_PASS_FILE)

edit-secrets:
	ansible-vault edit ./secrets/secrets.yml --vault-password-file $(VAULT_PASS_FILE)

ping-all:
	ansible all -i ./inventories/hosts -m ping -u ubuntu