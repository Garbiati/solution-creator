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

# Create a Domain class library and add it to the solution
dotnet new classlib -n "$project_name.Domain" -o "$project_name.Domain"
dotnet sln add "./$project_name.Domain/$project_name.Domain.csproj"
echo "Created Domain class library and added to the solution."

# Create a Web API project and add it to the solution
dotnet new webapi -n "$project_name.Api"
dotnet sln add "./$project_name.Api/$project_name.Api.csproj"
echo "Created Web API project and added to the solution."

# Create additional class libraries and add them to the solution
dotnet new classlib -n "$project_name.Infra.Data" -o "$project_name.Infra.Data"
dotnet sln add "./$project_name.Infra.Data/$project_name.Infra.Data.csproj"
echo "Created Infra.Data class library and added to the solution."

dotnet new classlib -n "$project_name.Infra.IoC" -o "$project_name.Infra.IoC"
dotnet sln add "./$project_name.Infra.IoC/$project_name.Infra.IoC.csproj"
echo "Created Infra.IoC class library and added to the solution."

dotnet new classlib -n "$project_name.Application" -o "$project_name.Application"
dotnet sln add "./$project_name.Application/$project_name.Application.csproj"
echo "Created Application class library and added to the solution."

# Create a test project with xUnit and add it to the solution
dotnet new xunit -n "$project_name.Domain.Tests" -o "$project_name.Domain.Tests"
dotnet sln add "./$project_name.Domain.Tests/$project_name.Domain.Tests.csproj"
echo "Created test project and added to the solution."
