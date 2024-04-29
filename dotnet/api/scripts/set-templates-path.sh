#!/bin/bash


# Define path for the class templates
export CONTROLLER_BASE_TEMPLATE_PATH="$TEMPLATES_PATH/class/ApiControllerBase.cs"
export API_VERSIONING_TEMPLATE_PATH="$TEMPLATES_PATH/class/ApiVersioningSetup.cs"
export DBCONTEXT_TEMPLATE_PATH="$TEMPLATES_PATH/class/ApplicationDbContext.cs"
export NATIVE_INJECTOR_TEMPLATE_PATH="$TEMPLATES_PATH/class/NativeInjectorConfig.cs"
export PROGRAM_TEMPLATE_PATH="$TEMPLATES_PATH/class/NativeInjectorConfig.cs"
export SWAGGER_TEMPLATE_PATH="$TEMPLATES_PATH/class/SwaggerSetup.cs"

print_info "Controller Base Template Path: $CONTROLLER_BASE_TEMPLATE_PATH"
print_info "Api Versioning Template Path: $API_VERSIONING_TEMPLATE_PATH"
print_info "DbContext Template Path: $DBCONTEXT_TEMPLATE_PATH"
print_info "Native Injector Template Path: $NATIVE_INJECTOR_TEMPLATE_PATH"
print_info "Program Template Path: $PROGRAM_TEMPLATE_PATH"
print_info "Swagger Template Path: $SWAGGER_TEMPLATE_PATH"


# Define paths for the Docker-related templates
export DOCKERFILE_TEMPLATE_PATH="$TEMPLATES_PATH/docker/Dockerfile"
export DOCKERFILE_LIVE_TEMPLATE_PATH="$TEMPLATES_PATH/docker/Dockerfile.live"
export DOCKER_COMPOSE_TEMPLATE_PATH="$TEMPLATES_PATH/docker/docker-compose.yml"

print_info "Dockerfile Template Path: $DOCKERFILE_TEMPLATE_PATH"
print_info "Dockerfile.live Template Path: $DOCKERFILE_LIVE_TEMPLATE_PATH"
print_info "docker-compose Template Path: $DOCKER_COMPOSE_TEMPLATE_PATH"


