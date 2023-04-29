#!/bin/bash
# create_superuser.sh

# Set the directory containing the docker-compose.yml file
DOCKER_COMPOSE_DIR="../src/portfolio"

# Change the working directory to the directory containing the docker-compose.yml file
cd $DOCKER_COMPOSE_DIR

# Load the .env file
python -c "from dotenv import load_dotenv; load_dotenv(dotenv_path='../src/portfolio.env')"

# Set environment variables from the .env file
export DJANGO_SUPERUSER_USERNAME=$(grep DJANGO_SUPERUSER_USERNAME .env | cut -d '=' -f 2-)
export DJANGO_SUPERUSER_PASSWORD=$(grep DJANGO_SUPERUSER_PASSWORD .env | cut -d '=' -f 2-)
export DJANGO_SUPERUSER_EMAIL=$(grep DJANGO_SUPERUSER_EMAIL .env | cut -d '=' -f 2-)

# Run the createsuperuser command in the running container
docker-compose exec web python manage.py createsuperuser --noinput \
  --username "${DJANGO_SUPERUSER_USERNAME}" \
  --email "${DJANGO_SUPERUSER_EMAIL}"
