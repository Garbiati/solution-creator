#!/bin/bash

# Set the environment variable for the project name
export SOLUTION_NAME=${1:-Garbiati}

# Set the environment variable for the project directory
export SOLUTION_DIRECTORY="$HOME/$SOLUTION_NAME"

# Set the current directory as the main path
export RUN_PATH=$(cd "$(dirname "$0")" && pwd)

# Set path of the scripts and templates
export SCRIPTS_PATH="$RUN_PATH/scripts"
export TEMPLATES_PATH="$RUN_PATH/templates"

# Include utility functions
source "${SCRIPTS_PATH}/utils.sh"
source "${SCRIPTS_PATH}/utils.docker.sh"
source "${SCRIPTS_PATH}/utils.dotnet.sh"

print_info "Running scripts..."
# Run the scripts
run_script "set-templates-path"
run_script "create-solution"
run_script "create-projects"
run_script "add-projects-references"
run_script "create-structures"
run_script "add-nuget-package"
run_script "configure-domain"
run_script "configure-infra.data"
run_script "configure-infra.ioc"
run_script "configure-application"
run_script "configure-api"
run_script "configure-base"
run_script "configure-dev-env"
run_script "configure-git-repository"

# Final confirmation message
print_success "Script executed successfully!"

code $SOLUTION_DIRECTORY