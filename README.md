# Ota-ku-Api-Gateway

docker network create kong-net

Yaml file

```yaml
version: '3.8'

services:
  postgres:
    image: postgres:13
    container_name: kong-database
    networks:
      - kong-net
    environment:
      POSTGRES_USER: kong
      POSTGRES_DB: kong
      POSTGRES_PASSWORD: kongpass
    ports:
      - "5432:5432"

  kong:
    image: kong/kong-gateway:3.8.0.0
    container_name: kong-gateway
    networks:
      - kong-net
    depends_on:
      - postgres
    environment:
      KONG_DATABASE: postgres
      KONG_PG_HOST: kong-database
      KONG_PG_USER: kong
      KONG_PG_PASSWORD: kongpass
      KONG_PROXY_ACCESS_LOG: /dev/stdout
      KONG_ADMIN_ACCESS_LOG: /dev/stdout
      KONG_PROXY_ERROR_LOG: /dev/stderr
      KONG_ADMIN_ERROR_LOG: /dev/stderr
      KONG_ADMIN_LISTEN: 0.0.0.0:8001
      KONG_ADMIN_GUI_URL: http://localhost:8002
    ports:
      - "8000:8000"
      - "8443:8443"
      - "8001:8001"
      - "8444:8444"
      - "8002:8002"
      - "8445:8445"
      - "8003:8003"
      - "8004:8004"

networks:
  kong-net:
    driver: bridge
```

docker-compose up kong-init

docker-compose up -d
