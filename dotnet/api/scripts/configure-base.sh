#!/bin/bash
NEW_DOCKERCOMPOSE="docker-compose.yml"
sed "s/{{SOLUTION_NAME}}/$(echo "$SOLUTION_NAME" | tr '[:lower:]' '[:upper:]')/g" "$PATH_TEMPLATES_BASE_DOCKERCOMPOSE" > "$NEW_DOCKERCOMPOSE"
validate_file "$NEW_DOCKERCOMPOSE"

NEW_VSCODE_LAUNCH=".vscode/launch.json"
sed "s/{{SOLUTION_NAME}}/$SOLUTION_NAME/g" "$PATH_TEMPLATES_BASE_VSCODE_LAUNCH" > "$NEW_VSCODE_LAUNCH"
validate_file "$NEW_VSCODE_LAUNCH"

NEW_VSCODE_TASKS=".vscode/tasks.json"
sed "s/{{SOLUTION_NAME}}/$SOLUTION_NAME/g" "$PATH_TEMPLATES_BASE_VSCODE_TASKS" > "$NEW_VSCODE_TASKS"
validate_file "$NEW_VSCODE_TASKS"

NEW_DOT_ENV=".env"
sed -e "s/{{SOLUTION_NAME}}/$(echo "$SOLUTION_NAME" | tr '[:lower:]' '[:upper:]')/g" -e "s/{{DB_EXTERNAL_PORT}}/$DB_EXTERNAL_PORT/g" "$PATH_TEMPLATES_BASE_DOTENV" > "$NEW_DOT_ENV"
validate_file "$NEW_DOT_ENV"

NEW_DOT_ENV_EXAMPLE=".env-example"
sed "s/{{SOLUTION_NAME}}/$(echo "$SOLUTION_NAME" | tr '[:lower:]' '[:upper:]')/g" "$PATH_TEMPLATES_BASE_DOTENV_EXAMPLE" > "$NEW_DOT_ENV_EXAMPLE"
validate_file "$NEW_DOT_ENV_EXAMPLE"

print_info "Created docker-compose file."