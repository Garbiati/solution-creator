#!/bin/bash
# Function to run a script
run_script() {
    local script_name=$1
    print_info "Initializing script: ${script_name}.sh"
    source "${SCRIPTS_PATH}/${script_name}.sh" || {
        print_error "Error:${script_name}.sh failed."
        exit 1
    }
    print_success "Success on execute ${script_name}.sh"
}

# Function to print error messages in red
print_error() {
    echo -e "\033[31m$1\033[0m"
}

# Function to print success messages in green
print_success() {
    echo -e "\033[32m$1\033[0m"
}

# Function to print warning messages in yellow
print_warning() {
    echo -e "\033[33m$1\033[0m"
}

# Function to print information messages in blue
print_info() {
    echo -e "\033[34m$1\033[0m"
}

# Function to validate the project name
validate_project_name() {
    if [ -z "$PROJECT_NAME" ]; then
        print_error "Error: PROJECT_NAME is not set."
        exit 1
    fi
}

# Function to validate the project directory
validate_project_directory() {
    if [ -z "$PROJECT_DIRECTORY" ]; then
        print_error "Error: PROJECT_DIRECTORY is not set."
        exit 1
    fi
}

# Function to create a directory
create_directory() {
    local directory=$1
    mkdir -p "$directory" || {
        print_error "Error: Could not create the directory '$directory'."
        exit 1
    }
}

validate_directory() {
    local directory=$1
    if [ ! -d "$directory" ]; then
        print_error "Error: Directory '$directory' does not exist."
        exit 1
    fi
}

validate_file() {
    local file=$1
    if [ ! -f "$file" ]; then
        print_error "Error: File '$file' does not exist."
        exit 1
    fi
}

# Function to navigate to the project directory
navigate_to_project_directory() {
    cd "$PROJECT_DIRECTORY" || {
        print_error "Error: Could not navigate to the project directory '$PROJECT_DIRECTORY'."
        exit 1
    }
}