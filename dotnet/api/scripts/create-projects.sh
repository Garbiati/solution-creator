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

# Create a Domain class library and add it to the solution
dotnet new classlib -n "$PROJECT_NAME.Domain" -o "$PROJECT_NAME.Domain"
dotnet sln add "./$PROJECT_NAME.Domain/$PROJECT_NAME.Domain.csproj"
echo "Created Domain class library and added to the solution."

# Create a Web API project and add it to the solution
dotnet new webapi -n "$PROJECT_NAME.Api"
dotnet sln add "./$PROJECT_NAME.Api/$PROJECT_NAME.Api.csproj"
echo "Created Web API project and added to the solution."

# Create additional class libraries and add them to the solution
dotnet new classlib -n "$PROJECT_NAME.Infra.Data" -o "$PROJECT_NAME.Infra.Data"
dotnet sln add "./$PROJECT_NAME.Infra.Data/$PROJECT_NAME.Infra.Data.csproj"
echo "Created Infra.Data class library and added to the solution."

dotnet new classlib -n "$PROJECT_NAME.Infra.IoC" -o "$PROJECT_NAME.Infra.IoC"
dotnet sln add "./$PROJECT_NAME.Infra.IoC/$PROJECT_NAME.Infra.IoC.csproj"
echo "Created Infra.IoC class library and added to the solution."

dotnet new classlib -n "$PROJECT_NAME.Application" -o "$PROJECT_NAME.Application"
dotnet sln add "./$PROJECT_NAME.Application/$PROJECT_NAME.Application.csproj"
echo "Created Application class library and added to the solution."

# Create a test project with xUnit and add it to the solution
dotnet new xunit -n "$PROJECT_NAME.Domain.Tests" -o "$PROJECT_NAME.Domain.Tests"
dotnet sln add "./$PROJECT_NAME.Domain.Tests/$PROJECT_NAME.Domain.Tests.csproj"
echo "Created test project and added to the solution."
