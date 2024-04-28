#!/bin/bash

project_name=${1:-Garbiati}

# Add project references
dotnet add "./$project_name.Application/$project_name.Application.csproj" reference "./$project_name.Domain/$project_name.Domain.csproj"
dotnet add "./$project_name.Api/$project_name.Api.csproj" reference "./$project_name.Infra.IoC/$project_name.Infra.IoC.csproj"
dotnet add "./$project_name.Infra.Data/$project_name.Infra.Data.csproj" reference "./$project_name.Domain/$project_name.Domain.csproj"
dotnet add "./$project_name.Infra.IoC/$project_name.Infra.IoC.csproj" reference "./$project_name.Domain/$project_name.Domain.csproj" "./$project_name.Infra.Data/$project_name.Infra.Data.csproj"
dotnet add "./$project_name.Domain.Tests/$project_name.Domain.Tests.csproj" reference "./$project_name.Domain/$project_name.Domain.csproj"

echo "Added project references."
