#!/bin/bash

# Add Entity Framework Core and other necessary NuGet packages
dotnet add "$SOLUTION_NAME.Infra.Data/$SOLUTION_NAME.Infra.Data.csproj" package Microsoft.EntityFrameworkCore
dotnet add "$SOLUTION_NAME.Infra.Data/$SOLUTION_NAME.Infra.Data.csproj" package Microsoft.EntityFrameworkCore.Design
print_info "Added Entity Framework Core and Design packages to Infra.Data."

# Add Entity Framework Core packages for PostgreSQL to the Infra.Data project
dotnet add "$SOLUTION_NAME.Infra.Data/$SOLUTION_NAME.Infra.Data.csproj" package Npgsql.EntityFrameworkCore.PostgreSQL
print_info "Added Entity Framework Core PostgreSQL provider to Infra.Data."

# Add Entity Framework Core tools for migrations
dotnet add "$SOLUTION_NAME.Infra.Data/$SOLUTION_NAME.Infra.Data.csproj" package Microsoft.EntityFrameworkCore.Tools
print_info "Added Entity Framework Core Tools for migrations to Infra.Data."

# Add AspNetCoreJsonPatch package
dotnet add "$SOLUTION_NAME.Application/$SOLUTION_NAME.Application.csproj" package Microsoft.AspNetCore.JsonPatch
print_info add "$SOLUTION_NAME.Application/$SOLUTION_NAME.Application.csproj" package Microsoft.AspNetCore.JsonPatch

# Add AutoMapper packages
dotnet add "$SOLUTION_NAME.Application/$SOLUTION_NAME.Application.csproj" package AutoMapper
print_info add "$SOLUTION_NAME.Application/$SOLUTION_NAME.Application.csproj" package AutoMapper

# Add Api Versioning packages to the API project
dotnet add "$SOLUTION_NAME.Api/$SOLUTION_NAME.Api.csproj" package Microsoft.AspNetCore.Mvc.Versioning
dotnet add "$SOLUTION_NAME.Api/$SOLUTION_NAME.Api.csproj" package Microsoft.AspNetCore.Mvc.Versioning.ApiExplorer

# Add dotnetenv package to the API project
dotnet add "$SOLUTION_NAME.Api/$SOLUTION_NAME.Api.csproj" package DotNetEnv

# Add NewtonsoftJson package to the API project
dotnet add "$SOLUTION_NAME.Api/$SOLUTION_NAME.Api.csproj" package Microsoft.AspNetCore.Mvc.NewtonsoftJson

# Add Swashbuckle packages to the API project
dotnet add "$SOLUTION_NAME.Api/$SOLUTION_NAME.Api.csproj" package Swashbuckle.AspNetCore.Annotations