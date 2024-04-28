#!/bin/bash

project_name=${1:-Garbiati}

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
