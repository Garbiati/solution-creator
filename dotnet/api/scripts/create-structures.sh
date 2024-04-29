#!/bin/bash

# Remove the automatically created Class1.cs files
rm "$PROJECT_NAME.Domain/Class1.cs"
rm "$PROJECT_NAME.Application/Class1.cs"
rm "$PROJECT_NAME.Infra.Data/Class1.cs"
rm "$PROJECT_NAME.Infra.IoC/Class1.cs"
rm "$PROJECT_NAME.Api/$PROJECT_NAME.Api.http"
print_info "Removed automatically created Class1.cs files."

# Create basic structures for Domain, Application, and Infra.Data
mkdir "$PROJECT_NAME.Domain/Aggregates"
mkdir "$PROJECT_NAME.Domain/Entities"
mkdir "$PROJECT_NAME.Domain/Enum"
mkdir "$PROJECT_NAME.Domain/Interfaces"
mkdir "$PROJECT_NAME.Domain/Validation"

mkdir "$PROJECT_NAME.Application/Interfaces"
mkdir "$PROJECT_NAME.Application/Mappings"
mkdir "$PROJECT_NAME.Application/Services"
mkdir "$PROJECT_NAME.Application/ViewModels"


mkdir "$PROJECT_NAME.Infra.Data/Context"
mkdir "$PROJECT_NAME.Infra.Data/EntitiesConfiguration"
mkdir "$PROJECT_NAME.Infra.Data/Helpers/Data"
mkdir "$PROJECT_NAME.Infra.Data/Repositories"

mkdir -p "$PROJECT_NAME.Api/Controllers/Shared"
mkdir -p "$PROJECT_NAME.Api/Controllers/v1"
mkdir "$PROJECT_NAME.Api/Extensions"

print_info "Created basic structures for Domain, Application, and Infra.Data."