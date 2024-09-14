# Ota-ku-Api-Gateway
ota-ku-api-kong gateway

docker-compose up -d kong-database
docker-compose run --rm kong kong migrations bootstrap

docker-compose up -d
