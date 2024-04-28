#!/bin/bash

project_name=${1:-Garbiati}

# Run all other scripts
bash ./Scripts/create-solution.sh "$project_name"
bash ./Scripts/create-projects.sh "$project_name"
bash ./Scripts/add-projects-references.sh "$project_name"
bash ./Scripts/create-structures.sh "$project_name"
bash ./Scripts/add-nuget-package.sh "$project_name"
bash ./Scripts/configure-domain.sh "$project_name"
bash ./Scripts/configure-infra.sh "$project_name"
bash ./Scripts/configure-application.sh "$project_name"
bash ./Scripts/configure-presentation.sh "$project_name"
bash ./Scripts/configure-docker.sh "$project_name"
bash ./Scripts/configure-dev-env.sh "$project_name"
bash ./Scripts/configure-git-repository.sh "$project_name"

# Final confirmation message
echo "Script executed successfully!"
