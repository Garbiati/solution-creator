#!/bin/bash

project_name=${1:-Garbiati}

# Add Entity Framework Core and other necessary NuGet packages
dotnet add "$project_name.Infra.Data/$project_name.Infra.Data.csproj" package Microsoft.EntityFrameworkCore
dotnet add "$project_name.Infra.Data/$project_name.Infra.Data.csproj" package Microsoft.EntityFrameworkCore.Design
echo "Added Entity Framework Core and Design packages to Infra.Data."

# Add Entity Framework Core packages for PostgreSQL to the Infra.Data project
dotnet add "$project_name.Infra.Data/$project_name.Infra.Data.csproj" package Npgsql.EntityFrameworkCore.PostgreSQL
echo "Added Entity Framework Core PostgreSQL provider to Infra.Data."

# Add Entity Framework Core tools for migrations
dotnet add "$project_name.Infra.Data/$project_name.Infra.Data.csproj" package Microsoft.EntityFrameworkCore.Tools
echo "Added Entity Framework Core Tools for migrations to Infra.Data."

# Add AutoMapper packages to the Infra.IoC project
dotnet add "$project_name.Infra.IoC/$project_name.Infra.IoC.csproj" package AutoMapper.Extensions.Microsoft
