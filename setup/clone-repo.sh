#! /usr/bin/env bash
printf "\e[42m CLONE REPOSITORY \e[0m \n"
realpath() {
    [[ $1 = /* ]] && echo "$1" || echo "$PWD/${1#./}"
}

CURRENT_DIR="$(dirname "$(realpath $0)")"

SRC="${CURRENT_DIR}/../src"

cd ${SRC}

git clone -b develop git@bitbucket.org:work-house/account_common.git
git clone -b new-develop git@bitbucket.org:work-house/drone_account.git
git clone -b nedo-v2 git@bitbucket.org:work-house/drone_php.git
git clone -b ana-dev git@bitbucket.org:work-house/drone_backend.git
