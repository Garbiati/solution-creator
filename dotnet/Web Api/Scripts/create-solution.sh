#!/bin/bash

# Check if a project name is provided, otherwise use 'Garbiati' as default
project_name=${1:-Garbiati}
echo "Project name is set to '$project_name'."

# Change to the user's home directory
cd ~
echo "Changed to the home directory."

# Create a directory for the project and enter it
mkdir "$project_name"
cd "$project_name"
echo "Created and entered the directory $project_name."

# Create a solution
dotnet new sln -n "$project_name"
echo "Created a new solution file named $project_name."
