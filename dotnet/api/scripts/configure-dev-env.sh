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

# Create the .vscode directory
mkdir -p ".vscode"
echo "Created .vscode directory."

# Extract .NET Core version from the .csproj file
net_version=$(grep '<TargetFramework>' "$PROJECT_NAME.Api/$PROJECT_NAME.Api.csproj" | awk -F'[<>]' '{print $3}' | sed 's/netcoreapp//;s/[^0-9.]*//g')

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
            "name": "Debug $PROJECT_NAME.Api",
            "type": "coreclr",
            "request": "launch",
            "preLaunchTask": "build",
            "program": "\${workspaceFolder}/$PROJECT_NAME.Api/bin/Debug/$net_version/$PROJECT_NAME.Api.dll",
            "args": [],
            "cwd": "\${workspaceFolder}/$PROJECT_NAME.Api",
            "stopAtEntry": false,
            "serverReadyAction": {
                "action": "openExternally",
                "pattern": "\\\\bNow listening on:\\\\s+(http?://\\\\S+)",
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
            "name": "Debug $PROJECT_NAME.Domain.Tests",
            "type": "coreclr",
            "request": "launch",
            "preLaunchTask": "build",
            "program": "\${workspaceFolder}/$PROJECT_NAME.Domain.Tests/bin/Debug/$net_version/$PROJECT_NAME.Domain.Tests.dll",
            "args": [],
            "cwd": "\${workspaceFolder}/$PROJECT_NAME.Domain.Tests",
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
                "\${workspaceFolder}/$PROJECT_NAME.Api/$PROJECT_NAME.Api.csproj"
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
                "\${workspaceFolder}/$PROJECT_NAME.Api/$PROJECT_NAME.Api.csproj"
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
                "\${workspaceFolder}/$PROJECT_NAME.Domain.Tests/$PROJECT_NAME.Domain.Tests.csproj"
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
                "\${workspaceFolder}/$PROJECT_NAME.Api/$PROJECT_NAME.Api.csproj"
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