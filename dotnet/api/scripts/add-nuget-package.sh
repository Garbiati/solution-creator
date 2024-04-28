#!/bin/bash

# Check if PROJECT_DIRECTORY is set
if [ -z "$PROJECT_DIRECTORY" ]; then
    echo "Error: PROJECT_DIRECTORY is not set."
    exit 1
fi

# Navigate to the project directory
cd "$PROJECT_DIRECTORY"

# Set the project name
PROJECT_NAME=${1:-Garbiati}

# Add Entity Framework Core and other necessary NuGet packages
dotnet add "$PROJECT_NAME.Infra.Data/$PROJECT_NAME.Infra.Data.csproj" package Microsoft.EntityFrameworkCore
dotnet add "$PROJECT_NAME.Infra.Data/$PROJECT_NAME.Infra.Data.csproj" package Microsoft.EntityFrameworkCore.Design
echo "Added Entity Framework Core and Design packages to Infra.Data."

# Add Entity Framework Core packages for PostgreSQL to the Infra.Data project
dotnet add "$PROJECT_NAME.Infra.Data/$PROJECT_NAME.Infra.Data.csproj" package Npgsql.EntityFrameworkCore.PostgreSQL
echo "Added Entity Framework Core PostgreSQL provider to Infra.Data."

# Add Entity Framework Core tools for migrations
dotnet add "$PROJECT_NAME.Infra.Data/$PROJECT_NAME.Infra.Data.csproj" package Microsoft.EntityFrameworkCore.Tools
echo "Added Entity Framework Core Tools for migrations to Infra.Data."

# Add AutoMapper packages to the Infra.IoC project
dotnet add "$PROJECT_NAME.Infra.IoC/$PROJECT_NAME.Infra.IoC.csproj" package AutoMapper.Extensions.Microsoft
