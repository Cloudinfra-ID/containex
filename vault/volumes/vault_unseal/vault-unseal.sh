#!/bin/bash

VAULT_ADDR=http://vault:8200
UNSEAL_FILE="/vault/unseal/unseal.json"

if [ ! -f "$UNSEAL_FILE" ]; then
  echo "Unseal file not found: $UNSEAL_FILE"
  exit 1
fi

for key in $(jq -r '.unseal_keys_b64[]' "$UNSEAL_FILE"); do
  response=$(curl -s --request PUT --data "{\"key\": \"$key\"}" "$VAULT_ADDR/v1/sys/unseal")
  sealed=$(echo "$response" | jq -r '.sealed')
  echo "Unseal response: $sealed"
  if [ "$sealed" == "false" ]; then
    echo "Vault is unsealed"
    break
  fi
done