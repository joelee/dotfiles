#!/bin/bash

type get-secret.sh >/dev/null 2>&1 && exit

cp "${HOME}/.local/share/chezmoi/private_dot_local/bin/executable_get-secret.sh" "${HOME}/.local/bin/get-secret.sh"
chmod +x "${HOME}/.local/bin/get-secret.sh"
