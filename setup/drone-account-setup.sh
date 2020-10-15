#!/usr/bin/env bash
printf "\e[42m RUN DOCKER FOR DRONE-ACCOUNT \e[0m \n"

realpath() {
    [[ $1 = /* ]] && echo "$1" || echo "$PWD/${1#./}"
}

# Get current dir
CURRENT_DIR="$(dirname "$(realpath $0)")"
ROOT="${CURRENT_DIR}/../"

cd ${ROOT}

docker-compose exec workspace bash -c "cd drone_account && composer install"
docker-compose exec workspace bash -c "cd drone_account && cp .env.example .env"
docker-compose exec workspace bash -c "cd drone_account && chmod -R 777 storage bootstrap"
docker-compose exec workspace bash -c "cd drone_account && npm i && gulp"
