#!/bin/bash

project_name=${1:-Garbiati}

# Initialize the Git repository
git init
echo "Initialized a new Git repository."

# Create a .gitignore file using the dotnet CLI
dotnet new gitignore
echo "Created a .gitignore file for .NET."

# Add all files to the staging area
git add .
echo "Added all files to the staging area."

# Commit the files with a message
git commit -m "microservice base structure"
echo "Committed the files with the message 'microservice base structure'."
