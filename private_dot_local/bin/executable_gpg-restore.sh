#!/usr/bin/env bash
#
# gpg-restore.sh - Import GPG keys from encrypted ZIP backup
#
# Usage: ./gpg-restore.sh my-backup.zip

set -euo pipefail

BACKUP_FILE="${1:-}"

if [[ -z "$BACKUP_FILE" ]]; then
  echo "Usage: $0 backup-file.zip"
  exit 1
fi

TMPDIR=$(mktemp -d)
trap 'rm -rf "$TMPDIR"' EXIT

echo "[*] Extracting encrypted backup..."
unzip "$BACKUP_FILE" -d "$TMPDIR"

echo "[*] Importing public key..."
gpg --import "$TMPDIR/public.asc"

echo "[*] Importing private key..."
gpg --import "$TMPDIR/private.asc"

if [[ -f "$TMPDIR/subkeys.asc" ]]; then
  echo "[*] Importing subkeys..."
  gpg --import "$TMPDIR/subkeys.asc"
fi

if [[ -d "$TMPDIR/password-store" ]]; then
  mv "$TMPDIR/password-store" "$HOME/.password-store"
  chown 0700 "$HOME/.password-store"
fi


echo "[*] Importing trust database..."
gpg --import-ownertrust < "$TMPDIR/ownertrust.txt"

echo "[✔] Restore complete. Verify with:"
echo "    gpg --list-secret-keys --keyid-format LONG"

