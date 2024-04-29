#!/bin/bash

# Remove the automatically created Class1.cs files
rm "$PROJECT_NAME.Domain/Class1.cs"
rm "$PROJECT_NAME.Application/Class1.cs"
rm "$PROJECT_NAME.Infra.Data/Class1.cs"
rm "$PROJECT_NAME.Infra.IoC/Class1.cs"
rm "$PROJECT_NAME.Api/$PROJECT_NAME.Api.http"
print_info "Removed automatically created Class1.cs files."

# Create basic structures for Domain, Application, and Infra.Data
mkdir "$PROJECT_NAME.Domain/Entities" "$PROJECT_NAME.Domain/Interfaces" "$PROJECT_NAME.Domain/Validation"
mkdir "$PROJECT_NAME.Application/ViewModels" "$PROJECT_NAME.Application/Interfaces" "$PROJECT_NAME.Application/Mappings" "$PROJECT_NAME.Application/Services"
mkdir "$PROJECT_NAME.Infra.Data/Context" "$PROJECT_NAME.Infra.Data/EntitiesConfiguration" "$PROJECT_NAME.Infra.Data/Repositories"
print_info "Created basic structures for Domain, Application, and Infra.Data."