#!/bin/bash

# Check if a project name is provided, otherwise use 'Garbiatoso' as default
project_name=${1:-Garbiati}
echo "Project name is set to '$project_name'."

# Change to the user's home directory
cd ~
echo "Changed to the home directory."

# Create a directory for the microservice and enter the directory
mkdir "$project_name"
cd "$project_name"
echo "Created and entered the directory $project_name."

# Run the command to trust the .NET SDK HTTPS development certificate
dotnet dev-certs https --trust
echo "Trusted the .NET SDK HTTPS development certificate."

# Create a Solution file
dotnet new sln -n "$project_name"
echo "Created a new solution file named $project_name."

# Create a Domain class library and add it to the Solution
dotnet new classlib -n "$project_name".Domain -o "$project_name".Domain
dotnet sln add "./$project_name.Domain/$project_name.Domain.csproj"
echo "Created Domain class library and added to the solution."

# Create a Web API project and add it to the Solution
dotnet new webapi -n "$project_name".Api
dotnet sln add "./$project_name.Api/$project_name.Api.csproj"
echo "Created Web API project and added to the solution."

# Create an Infra.Data class library and add it to the Solution
dotnet new classlib -n "$project_name".Infra.Data -o "$project_name".Infra.Data
dotnet sln add "./$project_name.Infra.Data/$project_name.Infra.Data.csproj"
echo "Created Infra.Data class library and added to the solution."

# Create an Infra.IoC class library and add it to the Solution
dotnet new classlib -n "$project_name".Infra.IoC -o "$project_name".Infra.IoC
dotnet sln add "./$project_name.Infra.IoC/$project_name.Infra.IoC.csproj"
echo "Created Infra.IoC class library and added to the solution."

# Create an Application class library and add it to the Solution
dotnet new classlib -n "$project_name".Application -o "$project_name".Application
dotnet sln add "./$project_name.Application/$project_name.Application.csproj"
echo "Created Application class library and added to the solution."

# Create a test project with xUnit and add it to the Solution
dotnet new xunit -n "$project_name".Domain.Tests -o "$project_name".Domain.Tests
dotnet sln add "./$project_name.Domain.Tests/$project_name.Domain.Tests.csproj"
echo "Created test project and added to the solution."

# Add project references
dotnet add "./$project_name.Application/$project_name.Application.csproj" reference "./$project_name.Domain/$project_name.Domain.csproj"
dotnet add "./$project_name.Api/$project_name.Api.csproj" reference "./$project_name.Infra.IoC/$project_name.Infra.IoC.csproj"
dotnet add "./$project_name.Infra.Data/$project_name.Infra.Data.csproj" reference "./$project_name.Domain/$project_name.Domain.csproj"
dotnet add "./$project_name.Infra.IoC/$project_name.Infra.IoC.csproj" reference "./$project_name.Domain/$project_name.Domain.csproj" "./$project_name.Infra.Data/$project_name.Infra.Data.csproj"
dotnet add "./$project_name.Domain.Tests/$project_name.Domain.Tests.csproj" reference "./$project_name.Domain/$project_name.Domain.csproj"
echo "Added project references."

# Remove the automatically created Class1.cs files
rm "$project_name.Domain/Class1.cs"
rm "$project_name.Application/Class1.cs"
rm "$project_name.Infra.Data/Class1.cs"
rm "$project_name.Infra.IoC/Class1.cs"
rm "$project_name.Api/$project_name.Api.http"
echo "Removed automatically created Class1.cs files."

# Create basic structures for Domain, Application, and Infra.Data
mkdir "$project_name.Domain/Entities" "$project_name.Domain/Interfaces" "$project_name.Domain/Validation"
mkdir "$project_name.Application/ViewModels" "$project_name.Application/Interfaces" "$project_name.Application/Mappings" "$project_name.Application/Services"
mkdir "$project_name.Infra.Data/Context" "$project_name.Infra.Data/EntitiesConfiguration" "$project_name.Infra.Data/Repositories"
echo "Created basic structures for Domain, Application, and Infra.Data."

# Add Entity Framework Core and other necessary NuGet packages
dotnet add "$project_name.Infra.Data/$project_name.Infra.Data.csproj" package Microsoft.EntityFrameworkCore
dotnet add "$project_name.Infra.Data/$project_name.Infra.Data.csproj" package Microsoft.EntityFrameworkCore.Design
echo "Added Entity Framework Core and Design packages to Infra.Data."

# Add Entity Framework Core packages for PostgreSQL to the Infra.Data project
dotnet add "$project_name.Infra.Data/$project_name.Infra.Data.csproj" package Npgsql.EntityFrameworkCore.PostgreSQL
echo "Added Entity Framework Core PostgreSQL provider to Infra.Data."

# Add Entity Framework Core tools for migrations
dotnet add "$project_name.Infra.Data/$project_name.Infra.Data.csproj" package Microsoft.EntityFrameworkCore.Tools
echo "Added Entity Framework Core Tools for migrations to Infra.Data."

# Add AutoMapper packages to the Infra.IoC project
dotnet add "$project_name.Infra.IoC/$project_name.Infra.IoC.csproj" package AutoMapper.Extensions.Microsoft.DependencyInjection
echo "Added AutoMapper extensions to Infra.IoC."

#####################################################################################################################################
# VSCODE
#####################################################################################################################################

# Create the .vscode directory
mkdir -p ".vscode"
echo "Created .vscode directory."

# Extract .NET Core version from the .csproj file
net_version=$(grep '<TargetFramework>' "$project_name.Api/$project_name.Api.csproj" | awk -F'[<>]' '{print $3}' | sed 's/netcoreapp//;s/[^0-9.]*//g')

# Check if .NET version was found
if [ -z "$net_version" ]; then
    echo "Unable to determine .NET Core version, defaulting to net8.0"
    net_version="net8.0"
else
    net_version="net$net_version"
fi

# Create and configure launch.json for debugging configuration
cat > ".vscode/launch.json" <<EOL
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Debug $project_name.Api",
            "type": "coreclr",
            "request": "launch",
            "preLaunchTask": "build",
            "program": "\${workspaceFolder}/$project_name.Api/bin/Debug/$net_version/$project_name.Api.dll",
            "args": [],
            "cwd": "\${workspaceFolder}/$project_name.Api",
            "stopAtEntry": false,
            "serverReadyAction": {
                "action": "openExternally",
                "pattern": "\\\\bNow listening on:\\\\s+(https?://\\\\S+)",
                "uriFormat": "%s/swagger"
            },
            "env": {
                "ASPNETCORE_ENVIRONMENT": "Development"
            },
            "sourceFileMap": {
                "/Views": "\${workspaceFolder}/Views"
            }
        },
        {
            "name": "Debug $project_name.Domain.Tests",
            "type": "coreclr",
            "request": "launch",
            "preLaunchTask": "build",
            "program": "\${workspaceFolder}/$project_name.Domain.Tests/bin/Debug/$net_version/$project_name.Domain.Tests.dll",
            "args": [],
            "cwd": "\${workspaceFolder}/$project_name.Domain.Tests",
            "stopAtEntry": false,
            "console": "internalConsole",
            "env": {
                "ASPNETCORE_ENVIRONMENT": "Development"
            },
            "sourceFileMap": {
                "/Views": "\${workspaceFolder}/Views"
            }
        }
    ]
}
EOL
echo "Created and configured launch.json in .vscode directory."

# Create and configure tasks.json for build and run tasks
cat > ".vscode/tasks.json" <<EOL
{
    "version": "2.0.0",
    "tasks": [
        {
            "label": "build",
            "command": "dotnet",
            "type": "process",
            "args": [
                "build",
                "\${workspaceFolder}/$project_name.Api/$project_name.Api.csproj"
            ],
            "problemMatcher": "\$msCompile",
            "group": {
                "kind": "build",
                "isDefault": true
            }
        },
        {
            "label": "run",
            "command": "dotnet",
            "type": "process",
            "args": [
                "run",
                "\${workspaceFolder}/$project_name.Api/$project_name.Api.csproj"
            ],
            "problemMatcher": "\$msCompile",
            "group": {
                "kind": "build",
                "isDefault": true
            }
        },
        {
            "label": "test",
            "command": "dotnet",
            "type": "process",
            "args": [
                "test",
                "\${workspaceFolder}/$project_name.Domain.Tests/$project_name.Domain.Tests.csproj"
            ],
            "problemMatcher": "\$msCompile",
            "group": {
                "kind": "test",
                "isDefault": true
            }
        },
        {
            "label": "watch",
            "command": "dotnet",
            "type": "process",
            "args": [
                "watch",
                "run",
                "\${workspaceFolder}/$project_name.Api/$project_name.Api.csproj"
            ],
            "problemMatcher": "\$msCompile",
            "group": {
                "kind": "build",
                "isDefault": true
            }
        }
    ]
}
EOL
echo "Created and configured tasks.json in .vscode directory."


#####################################################################################################################################
# Update some default class
#####################################################################################################################################
# Update the Program.cs in the Api project
cat > "$project_name.Api/Program.cs" <<EOL
var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
ConfigureServices(builder.Services);

var app = builder.Build();

// Configure the HTTP request pipeline.
ConfigurePipeline(app);

app.Run();

void ConfigureServices(IServiceCollection services)
{
    services.AddEndpointsApiExplorer();
    services.AddSwaggerGen();
    services.AddHealthChecks();
}

void ConfigurePipeline(WebApplication app)
{
    if (app.Environment.IsDevelopment())
    {
        app.UseSwagger();
        app.UseSwaggerUI();
    }
    app.UseHttpsRedirection();
    app.MapHealthChecks("/health");
}
EOL
echo "Updated Program.cs in the Api project."

# Update the launchSettings.json in the Api project
mkdir -p "$project_name.Api/Properties"
cat > "$project_name.Api/Properties/launchSettings.json" <<EOL
{
  "profiles": {
    "$project_name.Api": {
      "commandName": "Project",
      "launchBrowser": true,
      "launchUrl": "swagger",
      "applicationUrl": "https://localhost:5001;http://localhost:5000",
      "environmentVariables": {
        "ASPNETCORE_ENVIRONMENT": "Development"
      }
    }
  }
}
EOL
echo "Updated launchSettings.json in the Api project."



#####################################################################################################################################
# GIT
#####################################################################################################################################
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

# Final confirmation message
echo "Script executed successfully!"

code .

