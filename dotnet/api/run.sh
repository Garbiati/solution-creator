#!/bin/bash

# Function to handle replacing the existing solution directory
handle_replace_directory() {
    if [[ -d "$SOLUTION_DIRECTORY" ]]; then
        print_info "Removing existing directory: $SOLUTION_DIRECTORY"
        if ! rm -rf "$SOLUTION_DIRECTORY"; then
            print_error "Failed to remove the existing directory: $SOLUTION_DIRECTORY"
            return 1
        fi
        print_success "Directory removed: $SOLUTION_DIRECTORY"
    else
        print_info "Directory $SOLUTION_DIRECTORY does not exist, no need to remove."
    fi
}


# Set the environment variable for the project name
export SOLUTION_NAME=${1:-Garbiati}

# generate a random number between 1000 and 9999
export DB_EXTERNAL_PORT=$((1000 + RANDOM % 8999))

# Set the environment variable for the project directory
export SOLUTION_DIRECTORY="$HOME/Projects/$SOLUTION_NAME"

# Set the current directory as the main path
export RUN_PATH=$(cd "$(dirname "$0")" && pwd)

# Set path of the scripts and templates
export SCRIPTS_PATH="$RUN_PATH/scripts"
export TEMPLATES_PATH="$RUN_PATH/templates"

# Include utility functions
source "${SCRIPTS_PATH}/utils.sh"
source "${SCRIPTS_PATH}/utils.docker.sh"
source "${SCRIPTS_PATH}/utils.dotnet.sh"

# Check for --replace argument and handle directory removal
if [[ "$2" == "--replace" ]]; then
    handle_replace_directory || exit 1
fi

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