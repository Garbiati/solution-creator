#!/bin/bash

# Get the project name and define the project directory
project_name=${1:-Garbiati}
project_directory="$HOME/$project_name"

# Set the environment variable for the project directory
export PROJECT_DIRECTORY="$project_directory"

# Create a directory for the project and navigate to it
mkdir -p "$project_directory"
echo "Created the directory '$project_directory'."

# Run all other scripts with the project name
bash ./scripts/create-solution.sh "$project_name"
bash ./scripts/create-projects.sh "$project_name"
bash ./scripts/add-projects-references.sh "$project_name"
bash ./scripts/create-structures.sh "$project_name"
bash ./scripts/add-nuget-package.sh "$project_name"
bash ./scripts/configure-domain.sh "$project_name"
bash ./scripts/configure-infra.sh "$project_name"
bash ./scripts/configure-application.sh "$project_name"
bash ./scripts/configure-presentation.sh "$project_name"
bash ./scripts/configure-docker.sh "$project_name"
bash ./scripts/configure-dev-env.sh "$project_name"
bash ./scripts/configure-git-repository.sh "$project_name"

# Final confirmation message
echo "Script executed successfully!"

code $project_directory