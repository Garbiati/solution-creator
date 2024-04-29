#!/bin/bash

# Define paths for the Docker-related templates
export DOCKERFILE_TEMPLATE_PATH="$TEMPLATES_PATH/docker/Dockerfile"
export DOCKERFILE_LIVE_TEMPLATE_PATH="$TEMPLATES_PATH/docker/Dockerfile.live"
export DOCKER_COMPOSE_TEMPLATE_PATH="$TEMPLATES_PATH/docker/docker-compose.yml"

print_info "Dockerfile Template Path: $DOCKERFILE_TEMPLATE_PATH"
print_info "Dockerfile.live Template Path: $DOCKERFILE_LIVE_TEMPLATE_PATH"
print_info "docker-compose Template Path: $DOCKER_COMPOSE_TEMPLATE_PATH"
