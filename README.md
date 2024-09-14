# Ota-ku-Api-Gateway

## Настройка и запуск

Создайте сеть для контейнеров:
```bash
docker network create kong-net
```

Запустите все контейнеры в фоновом режиме:
```bash
docker-compose up -d
```

Создайте дамп базы данных из контейнера:
```bash
docker exec -t kong-database pg_dumpall -c -U kong > backup.sql
```

Восстановите базу данных из дампа:
```bash
cat backup.sql | docker exec -i kong-database psql -U kong -d kong
```