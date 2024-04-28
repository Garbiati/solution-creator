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

# Add project references
dotnet add "./$PROJECT_NAME.Application/$PROJECT_NAME.Application.csproj" reference "./$PROJECT_NAME.Domain/$PROJECT_NAME.Domain.csproj"
dotnet add "./$PROJECT_NAME.Api/$PROJECT_NAME.Api.csproj" reference "./$PROJECT_NAME.Infra.IoC/$PROJECT_NAME.Infra.IoC.csproj"
dotnet add "./$PROJECT_NAME.Infra.Data/$PROJECT_NAME.Infra.Data.csproj" reference "./$PROJECT_NAME.Domain/$PROJECT_NAME.Domain.csproj"
dotnet add "./$PROJECT_NAME.Infra.IoC/$PROJECT_NAME.Infra.IoC.csproj" reference "./$PROJECT_NAME.Domain/$PROJECT_NAME.Domain.csproj" "./$PROJECT_NAME.Infra.Data/$PROJECT_NAME.Infra.Data.csproj"
dotnet add "./$PROJECT_NAME.Domain.Tests/$PROJECT_NAME.Domain.Tests.csproj" reference "./$PROJECT_NAME.Domain/$PROJECT_NAME.Domain.csproj"

echo "Added project references."
