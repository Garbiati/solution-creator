#!/bin/bash

# Function to run dotnet restore
dotnet_restore()
{
    dotnet restore
}

dotnet_tools_is_installed() {
    dotnet tool list --global | grep -q dotnet-ef
}

dotnet_tools_install() {
#check if dotnet-ef is installed
    if ! dotnet_tools_is_installed; then
        dotnet_tools_install
    fi
}

dotnet_tools_update() {
    dotnet tool update --global dotnet-ef
}

dotnet_ef_migrations_add() {
    dotnet ef migrations add $1 --project $SOLUTION_NAME.Infra.Data --startup-project $SOLUTION_NAME.Api
}

dotnet_ef_migrations_remove() {
    dotnet ef migrations remove --project $SOLUTION_NAME.Infra.Data --startup-project $SOLUTION_NAME.Api
}

dotnet_ef_migrations_update() {
    dotnet ef database update --project $SOLUTION_NAME.Infra.Data --startup-project $SOLUTION_NAME.Api
}


dotnet_ef_first_migration() {
    dotnet_ef_migrations_add Initial
    dotnet_ef_migrations_update
}
