#!/bin/bash
VAULT_DIR="$HOME/ansible-vault-lab/vault_files"
VAULT_PASS_FILE="$HOME/.vault_pass"

echo "=== Ansible Vault Inventory ==="
for vault_file in "$VAULT_DIR"/*.yml; do
    if [ -f "$vault_file" ]; then
        echo "File: $(basename "$vault_file")"
        echo "Size: $(stat -c%s "$vault_file") bytes"
        var_count=$(ansible-vault view "$vault_file" --vault-password-file "$VAULT_PASS_FILE" 2>/dev/null | grep -c "^[a-zA-Z]" || echo "vault-id-protected")
        echo "Variables Count: $var_count"
        echo "---"
    fi
done
