#!/bin/bash

# Create solution directory
create_directory "$SOLUTION_DIRECTORY"
print_info "Created project directory at $SOLUTION_DIRECTORY"

# Navigate to the project directory
navigate_to_SOLUTION_DIRECTORY
print_info "Navigated to the project directory."

# Create a solution
dotnet new sln -n "$SOLUTION_NAME"
