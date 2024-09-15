# Ota-ku-Api-Gateway

## Setup and Startup

Create a network for containers:
```bash
docker network create kong-net
```
Email:    admin@example.com
Password: changeme

Run all containers in the background:
```bash
docker-compose run kong kong migrations bootstrap

docker-compose up -d
```

Dump the database from the container:
```bash
docker exec -t kong-database pg_dumpall -c -U kong > backup.sql
```

Restore the database from the dump:
```bash
cat backup.sql | docker exec -i kong-database psql -U kong -d kong
```