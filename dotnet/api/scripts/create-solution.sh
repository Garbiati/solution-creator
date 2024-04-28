#!/bin/bash

# Check if PROJECT_DIRECTORY is set
if [ -z "$PROJECT_DIRECTORY" ]; then
    echo "Error: PROJECT_DIRECTORY is not set."
    exit 1
fi

# Navigate to the project directory
cd "$PROJECT_DIRECTORY"

# Set the project name
project_name=${1:-Garbiati}

# Create a solution
dotnet new sln -n "$project_name"
echo "Created a new solution file named $project_name."
