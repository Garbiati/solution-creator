#!/bin/bash

# Initialize the Git repository
git init
print_info "Initialized a new Git repository."

# Create a .gitignore file using the dotnet CLI
dotnet new gitignore
print_info "Created a .gitignore file for .NET."

# Add all files to the staging area
git add .
print_info "Added all files to the staging area."

# Commit the files with a message
git commit -m "microservice base structure"
print_info "Committed the files with the message 'microservice base structure'."