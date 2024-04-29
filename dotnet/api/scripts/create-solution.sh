#!/bin/bash

# Create solution directory
create_directory "$PROJECT_DIRECTORY"
print_info "Created project directory at $PROJECT_DIRECTORY"

# Navigate to the project directory
navigate_to_project_directory
print_info "Navigated to the project directory."

# Create a solution
dotnet new sln -n "$PROJECT_NAME"
