#!/bin/bash

# Add Entity Framework Core and other necessary NuGet packages
dotnet add "$PROJECT_NAME.Infra.Data/$PROJECT_NAME.Infra.Data.csproj" package Microsoft.EntityFrameworkCore
dotnet add "$PROJECT_NAME.Infra.Data/$PROJECT_NAME.Infra.Data.csproj" package Microsoft.EntityFrameworkCore.Design
print_info "Added Entity Framework Core and Design packages to Infra.Data."

# Add Entity Framework Core packages for PostgreSQL to the Infra.Data project
dotnet add "$PROJECT_NAME.Infra.Data/$PROJECT_NAME.Infra.Data.csproj" package Npgsql.EntityFrameworkCore.PostgreSQL
print_info "Added Entity Framework Core PostgreSQL provider to Infra.Data."

# Add Entity Framework Core tools for migrations
dotnet add "$PROJECT_NAME.Infra.Data/$PROJECT_NAME.Infra.Data.csproj" package Microsoft.EntityFrameworkCore.Tools
print_info "Added Entity Framework Core Tools for migrations to Infra.Data."

# Add AutoMapper packages
dotnet add "$PROJECT_NAME.Application/$PROJECT_NAME.Application.csproj" package AutoMapper
print_info add "$PROJECT_NAME.Application/$PROJECT_NAME.Application.csproj" package AutoMapper

# Add Api Versioning packages to the API project
dotnet add "$PROJECT_NAME.Api/$PROJECT_NAME.Api.csproj" package Microsoft.AspNetCore.Mvc.Versioning
dotnet add "$PROJECT_NAME.Api/$PROJECT_NAME.Api.csproj" package Microsoft.AspNetCore.Mvc.Versioning.ApiExplorer
