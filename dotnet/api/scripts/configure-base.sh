#!/bin/bash

validate_file "$PATH_TEMPLATES_BASE_DOCKERCOMPOSE"

NEW_DOCKERCOMPOSE="$PROJECT_NAME/docker-compose.yml"

sed "s/{{PROJECT_NAME}}/$PROJECT_NAME/g" "$PATH_TEMPLATES_BASE_DOCKERCOMPOSE" > "$NEW_DOCKERCOMPOSE"

validate_file "$NEW_DOCKERCOMPOSE"

print_info "Created docker-compose file."