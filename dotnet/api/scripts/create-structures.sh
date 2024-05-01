#!/bin/bash

# Remove the automatically created Class1.cs files
rm "$PROJECT_NAME.Domain/Class1.cs"
rm "$PROJECT_NAME.Application/Class1.cs"
rm "$PROJECT_NAME.Infra.Data/Class1.cs"
rm "$PROJECT_NAME.Infra.IoC/Class1.cs"
rm "$PROJECT_NAME.Api/$PROJECT_NAME.Api.http"
print_info "Removed automatically created Class1.cs files."


mkdir -p ".config"
mkdir -p ".vscode"

# Create basic structures for Domain, Application, and Infra.Data
mkdir -p "$PROJECT_NAME.Domain/Aggregates"
mkdir -p "$PROJECT_NAME.Domain/Common"
mkdir -p "$PROJECT_NAME.Domain/Entities"
mkdir -p "$PROJECT_NAME.Domain/Enums"
mkdir -p "$PROJECT_NAME.Domain/Interfaces"
mkdir -p "$PROJECT_NAME.Domain/Validations"

mkdir -p "$PROJECT_NAME.Application/Interfaces"
mkdir -p "$PROJECT_NAME.Application/Mappings"
mkdir -p "$PROJECT_NAME.Application/Services"
mkdir -p "$PROJECT_NAME.Application/ViewModels/Example"


mkdir -p "$PROJECT_NAME.Infra.Data/Context"
mkdir -p "$PROJECT_NAME.Infra.Data/EntitiesConfiguration"
mkdir -p "$PROJECT_NAME.Infra.Data/Helpers/Data"
mkdir -p "$PROJECT_NAME.Infra.Data/Repositories"

mkdir -p "$PROJECT_NAME.Api/Controllers/Shared"
mkdir -p "$PROJECT_NAME.Api/Controllers/v1"
mkdir -p "$PROJECT_NAME.Api/Extensions"


print_info "Created basic structures for Domain, Application, and Infra.Data."