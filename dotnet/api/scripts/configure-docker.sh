#!/bin/bash

# Ensure the Dockerfile template exists using the defined path
validate_file "$DOCKERFILE_TEMPLATE_PATH"

validate_file "$DOCKERFILE_LIVE_TEMPLATE_PATH"

validate_file "$DOCKER_COMPOSE_TEMPLATE_PATH"

# Path to the new Dockerfile
NEW_DOCKERFILE="$PROJECT_NAME.Api/Dockerfile"

NEW_DOCKERFILE_LIVE="$PROJECT_NAME.Api/Dockerfile.live"

NEW_DOCKER_COMPOSE="docker-compose.yml"

# Use 'sed' to replace placeholders with the project name
sed "s/{{PROJECT_NAME}}/$PROJECT_NAME/g" "$DOCKERFILE_TEMPLATE_PATH" > "$NEW_DOCKERFILE"

sed "s/{{PROJECT_NAME}}/$PROJECT_NAME/g" "$DOCKERFILE_LIVE_TEMPLATE_PATH" > "$NEW_DOCKERFILE_LIVE"

sed "s/{{PROJECT_NAME}}/$PROJECT_NAME/g" "$DOCKER_COMPOSE_TEMPLATE_PATH" > "$NEW_DOCKER_COMPOSE"

# Confirm successful creation
validate_file "$NEW_DOCKERFILE"

validate_file "$NEW_DOCKERFILE_LIVE"

validate_file "$NEW_DOCKER_COMPOSE"