#!/bin/bash
VAULT_DIR="$HOME/ansible-vault-lab/vault_files"
BACKUP_DIR="$HOME/ansible-vault-lab/backups"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_PATH="$BACKUP_DIR/vault_backup_$TIMESTAMP"

mkdir -p "$BACKUP_PATH"
cp "$VAULT_DIR"/*.yml "$BACKUP_PATH/" 2>/dev/null || true

cat > "$BACKUP_PATH/manifest.txt" << EOL
Vault Backup Manifest
Created: $(date)
Source: $VAULT_DIR
Files Backed Up:
$(ls -la "$BACKUP_PATH"/*.yml 2>/dev/null)
EOL

echo "Backup created successfully at: $BACKUP_PATH"
