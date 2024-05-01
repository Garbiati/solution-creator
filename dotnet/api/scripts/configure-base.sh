#!/bin/bash

NEW_DOCKERCOMPOSE="docker-compose.yml"
NEW_CONFIG_DOTNETTOOLS=".config/dotnet-tools.json"
NEW_VSCODE_LAUNCH=".vscode/launch.json"
NEW_VSCODE_TASKS=".vscode/tasks.json"

sed "s/{{PROJECT_NAME}}/$PROJECT_NAME/g" "$PATH_TEMPLATES_BASE_DOCKERCOMPOSE" > "$NEW_DOCKERCOMPOSE"
cp "$PATH_TEMPLATES_BASE_VSCODE_LAUNCH" "$NEW_VSCODE_LAUNCH"
cp "$PATH_TEMPLATES_BASE_VSCODE_TASKS" "$NEW_VSCODE_TASKS"
cp "$PATH_TEMPLATES_BASE_CONFIG_DOTNETTOOLS" "$NEW_CONFIG_DOTNETTOOLS"

validate_file "$NEW_DOCKERCOMPOSE"
validate_file "$NEW_CONFIG_DOTNETTOOLS"
validate_file "$NEW_VSCODE_LAUNCH"
validate_file "$NEW_VSCODE_TASKS"

print_info "Created docker-compose file."