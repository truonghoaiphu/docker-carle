#### Copy env

cp `.env.example` `.env`

#### Run docker

```text
docker-compose up -d --build
```

#### Clone repository

```text
setup/clone-repo.sh
```

### Setup source

```text
setup/main.sh
```

#### Config host

Add the below code to `/etc/hosts`

```text
127.0.0.1 api.drone.test
127.0.0.1 account.drone.test
127.0.0.1 control.drone.test
127.0.0.1 service.drone.test
```

#### Import database

```text
docker-compose exec database

mysql -u root -p'secret' source drone_import.sql
```
<!-- docker exec -i $(docker-compose ps -q mysql) mysql -u homestead -p'secret' drone < ./service/mysql/dump.sql -->

#### Config environment

Go to `src/drone_backend` and copy `APP_KEY` for all repo `drone_php, drone_account`

Edit`.env` file for all repo 

```text
DB_CONNECTION=mysql
DB_HOST=database
DB_PORT=3306
DB_DATABASE=homestead
DB_USERNAME=root
DB_PASSWORD=secret
```

*Drone_php .env*

```text
SESSION_DOMAIN=drone.test
SERVICE_PAGE=http://account.drone.test:8080
DOMAIN_UTM_API=http://api.drone.test:8080
```
*Drone_account .env*

```text
SESSION_DOMAIN=drone.test
CONTROL_PAGE=http://control.drone.test:8080
DOMAIN_UTM=http://control.drone.test:8080
```

#### Access from browser

```text
http://control.drone.test:8080/
http://api.drone.test:8080/
```

#### Exit

```text
docker-compose down
```