#!/bin/bash

# Get the project name and define the project directory
PROJECT_NAME=${1:-Garbiati}
project_directory="$HOME/$PROJECT_NAME"

# Set the environment variable for the project directory
export PROJECT_DIRECTORY="$project_directory"

# Create a directory for the project and navigate to it
mkdir -p "$project_directory"
echo "Created the directory '$project_directory'."

# Run all other scripts with the project name
bash ./scripts/create-solution.sh "$PROJECT_NAME"
bash ./scripts/create-projects.sh "$PROJECT_NAME"
bash ./scripts/add-projects-references.sh "$PROJECT_NAME"
bash ./scripts/create-structures.sh "$PROJECT_NAME"
bash ./scripts/add-nuget-package.sh "$PROJECT_NAME"
bash ./scripts/configure-domain.sh "$PROJECT_NAME"
bash ./scripts/configure-infra.sh "$PROJECT_NAME"
bash ./scripts/configure-application.sh "$PROJECT_NAME"
bash ./scripts/configure-presentation.sh "$PROJECT_NAME"
bash ./scripts/configure-docker.sh "$PROJECT_NAME"
bash ./scripts/configure-dev-env.sh "$PROJECT_NAME"
bash ./scripts/configure-git-repository.sh "$PROJECT_NAME"

# Final confirmation message
echo "Script executed successfully!"

code $project_directory