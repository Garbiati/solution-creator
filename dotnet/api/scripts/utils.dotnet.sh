#!/bin/bash

# Function to run dotnet restore
dotnet_restore() {
    dotnet restore
}

# Function to check if dotnet-ef is installed globally
dotnet_tools_is_installed() {
    dotnet tool list --global | grep -q dotnet-ef
}

# Function to install dotnet-ef if not installed
dotnet_tools_install() {
    if ! dotnet_tools_is_installed; then
        printf "INFO: dotnet-ef não está instalado. Instalando...\n"
        dotnet tool install --global dotnet-ef
        printf "INFO: Restaurando ferramentas dotnet...\n"
        dotnet tool restore  # Garantir que o dotnet-ef fique disponível após a instalação
    else
        printf "INFO: dotnet-ef já está instalado.\n"
    fi
}

# Function to update dotnet-ef
dotnet_tools_update() {
    dotnet tool update --global dotnet-ef
}

dotnet_new_tool-manifest() {
    dotnet new tool-manifest
}

# Function to add a migration using dotnet-ef
dotnet_ef_migrations_add() {
    dotnet ef migrations add "$1" --project "$SOLUTION_NAME.Infra.Data" --startup-project "$SOLUTION_NAME.Api"
}

# Function to remove the last migration using dotnet-ef
dotnet_ef_migrations_remove() {
    dotnet ef migrations remove --project "$SOLUTION_NAME.Infra.Data" --startup-project "$SOLUTION_NAME.Api"
}

# Function to update the database using dotnet-ef
dotnet_ef_migrations_update() {
    dotnet ef database update --project "$SOLUTION_NAME.Infra.Data" --startup-project "$SOLUTION_NAME.Api"
}

# Function to add the first migration and update the database
dotnet_ef_first_migration() {
    dotnet_ef_migrations_add "Initial"
    dotnet_ef_migrations_update
}


