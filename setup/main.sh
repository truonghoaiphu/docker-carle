#!/usr/bin/env bash

realpath() {
    [[ $1 = /* ]] && echo "$1" || echo "$PWD/${1#./}"
}

# Get current dir
CURRENT_DIR="$(dirname "$(realpath $0)")"

bash "${CURRENT_DIR}/account_common-setup.sh"
bash "${CURRENT_DIR}/drone-account-setup.sh"
bash "${CURRENT_DIR}/drone-backend-setup.sh"
bash "${CURRENT_DIR}/drone-php-setup.sh"