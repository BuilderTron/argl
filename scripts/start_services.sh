#!/bin/bash
# start_services.sh

# Set the directory containing the docker-compose.yml file
DOCKER_COMPOSE_DIR="../src/portfolio"

# Change the working directory to the directory containing the docker-compose.yml file
cd $DOCKER_COMPOSE_DIR

# Start the migrate service
docker-compose up -d --build migrate

# Get the migration container name
migrate_container_name=$(docker-compose ps -q migrate)

# Wait for the migration service to complete
while true; do
  migrate_status=$(docker inspect --format='{{.State.Status}}' $migrate_container_name)

  if [[ "$migrate_status" == "exited" ]]; then
    echo "Migration completed."
    break
  else
    echo "Waiting for migration to complete..."
    sleep 5
  fi
done

# Start the web service
docker-compose up -d --build web

