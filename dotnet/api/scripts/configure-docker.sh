#!/bin/bash

# Ensure the Dockerfile template exists using the defined path
validate_file "$DOCKERFILE_TEMPLATE_PATH"

# Path to the new Dockerfile within the .Api directory
NEW_DOCKERFILE="$PROJECT_NAME.Api/Dockerfile"

# Use 'sed' to replace placeholders with the project name
sed "s/{{PROJECT_NAME}}/$PROJECT_NAME/g" "$DOCKERFILE_TEMPLATE_PATH" > "$NEW_DOCKERFILE"

# Confirm successful creation
validate_file "$NEW_DOCKERFILE"