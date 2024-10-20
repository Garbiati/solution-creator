#!/bin/bash

# Remove the automatically created Class1.cs files
rm "$SOLUTION_NAME.Domain/Class1.cs"
rm "$SOLUTION_NAME.Application/Class1.cs"
rm "$SOLUTION_NAME.Infra.Data/Class1.cs"
rm "$SOLUTION_NAME.Infra.IoC/Class1.cs"
rm "$SOLUTION_NAME.Api/$SOLUTION_NAME.Api.http"
print_info "Removed automatically created Class1.cs files."

mkdir -p ".config"
mkdir -p ".vscode"

# Create basic structures for Domain, Application, and Infra.Data
mkdir -p "$SOLUTION_NAME.Domain/Common"
mkdir -p "$SOLUTION_NAME.Domain/Entities"
mkdir -p "$SOLUTION_NAME.Domain/Enums"
mkdir -p "$SOLUTION_NAME.Domain/Exceptions"
mkdir -p "$SOLUTION_NAME.Domain/Interfaces"
mkdir -p "$SOLUTION_NAME.Domain/Validations"

mkdir -p "$SOLUTION_NAME.Application/Interfaces"
mkdir -p "$SOLUTION_NAME.Application/Mappings"
mkdir -p "$SOLUTION_NAME.Application/Services"
mkdir -p "$SOLUTION_NAME.Application/DTO/Example"
mkdir -p "$SOLUTION_NAME.Application/DTO/ExampleItem"
mkdir -p "$SOLUTION_NAME.Application/DTO/Shared"

mkdir -p "$SOLUTION_NAME.Infra.Data/Context"
mkdir -p "$SOLUTION_NAME.Infra.Data/EntitiesConfiguration"
mkdir -p "$SOLUTION_NAME.Infra.Data/Helpers/Data"
mkdir -p "$SOLUTION_NAME.Infra.Data/Repositories"

mkdir -p "$SOLUTION_NAME.Api/Controllers/Shared"
mkdir -p "$SOLUTION_NAME.Api/Controllers/v1"
mkdir -p "$SOLUTION_NAME.Api/Extensions"


print_info "Created basic structures for Domain, Application, and Infra.Data."