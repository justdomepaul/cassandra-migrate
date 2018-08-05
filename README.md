## Usage 

##### set compose volume, config file and migrations folder
```yaml
    volumes:
      - ${PWD}/cassandra-migrate.yml:/cassandra-migrate.yml
      - ${PWD}/migrations:/migrations
```

##### outer link 
   if you need link to another compose's service container, create outer_net, 
   and set external property.
   set compose network and use it
   ```yaml 
        networks:
          output_net:
    networks:
     output_net:
       external: true
   ```

#### generate cql version
```bash
$ docker-compose run --rm cassandra-migrate generate 'create user'
```

#### migrate your version
```bash
$ docker-compose run --rm cassandra-migrate -H {cassandra server host} -y migrate
```

#### force advacing to version 2
```bash
$ docker-compose run --rm cassandra-migrate -H {cassandra server host} -y migrate 2 --force
```

#### reset to version 1
```bash
$ docker-compose run --rm cassandra-migrate -H {cassandra server host} -y reset 1
```