#!/usr/bin/env bash
#
# gpg-backup.sh - Export GPG keys and encrypt into a ZIP file
#
# Usage: ./gpg-backup.sh "you@example.com" my-backup.zip

set -euo pipefail

EMAIL="${1:-}"
BACKUP_FILE="${2:-gpg-backup.zip}"

if [[ -z "$EMAIL" ]]; then
    echo "Usage: $0 \"email@example.com\" [backup-file.zip]"
    exit 1
fi

# Ensure the backup path is relative to where the script is executed
BACKUP_PATH="$HOME/$BACKUP_FILE"

TMPDIR=$(mktemp -d)
trap 'rm -rf "$TMPDIR"' EXIT

echo "[*] Exporting public key..."
gpg --export -a "$EMAIL" >"$TMPDIR/public.asc"

echo "[*] Exporting private key..."
gpg --export-secret-keys -a "$EMAIL" >"$TMPDIR/private.asc"

echo "[*] Exporting subkeys (if any)..."
gpg --export-secret-subkeys -a "$EMAIL" >"$TMPDIR/subkeys.asc" || true

echo "[*] Exporting ownertrust..."
gpg --export-ownertrust >"$TMPDIR/ownertrust.txt"

if [ -d "$HOME/.password-store" ]; then
    echo "[*] Exporting Pass Store..."
    cp -R "$HOME/.password-store" "$TMPDIR/password_store"
fi

echo "[*] Creating encrypted ZIP archive ($BACKUP_PATH)..."
# zip will prompt for a password
(cd "$TMPDIR" && zip -9yer "$BACKUP_PATH" ./*)
chmod 0700 "$BACKUP_PATH"
 
echo "[✔] Backup complete: $BACKUP_PATH"
echo "    Keep it safe. Do NOT store unencrypted copies."
