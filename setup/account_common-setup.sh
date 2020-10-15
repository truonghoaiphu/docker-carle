#!/usr/bin/env bash
printf "\e[42mRUN DOCKER FOR ACCOUNT-COMMON\e[0m \n"

realpath() {
    [[ $1 = /* ]] && echo "$1" || echo "$PWD/${1#./}"
}

# Get current dir
CURRENT_DIR="$(dirname "$(realpath $0)")"
ROOT="${CURRENT_DIR}/../"

cd ${ROOT}

docker-compose exec workspace bash -c "cd account_common && composer install"
docker-compose exec workspace bash -c "cd account_common && cp .env.example .env"
docker-compose exec workspace bash -c "cd account_common && chmod -R 777 storage bootstrap"

