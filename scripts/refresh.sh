#!/bin/bash

# Set the directory containing the docker-compose.yml file
DOCKER_COMPOSE_DIR="../src/portfolio"

# Change the working directory to the directory containing the docker-compose.yml file
cd $DOCKER_COMPOSE_DIR

# Get the Django app service name (web) from docker-compose.yml
app_service_name="web"

# Run makemigrations
echo "Running makemigrations."
docker-compose exec $app_service_name python manage.py makemigrations

# Run migrate
echo "Migrating into database."
docker-compose exec $app_service_name python manage.py migrate

# Optional: If you want to restart the app after migrations
echo "Restarting web container."
docker-compose restart $app_service_name

echo "Migrations complete."
