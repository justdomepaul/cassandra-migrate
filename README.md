### Usage
1. set .env FOLDER_PATH

2. migrate your cassandra database

```bash
$ docker-compose run --rm cassandra-migrate create -dir ./migrations -ext .cql {filename}

```