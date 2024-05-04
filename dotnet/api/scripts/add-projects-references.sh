#!/bin/bash

# Add project references
dotnet add "./$SOLUTION_NAME.Application/$SOLUTION_NAME.Application.csproj" reference "./$SOLUTION_NAME.Domain/$SOLUTION_NAME.Domain.csproj"
dotnet add "./$SOLUTION_NAME.Api/$SOLUTION_NAME.Api.csproj" reference "./$SOLUTION_NAME.Infra.IoC/$SOLUTION_NAME.Infra.IoC.csproj"
dotnet add "./$SOLUTION_NAME.Infra.Data/$SOLUTION_NAME.Infra.Data.csproj" reference "./$SOLUTION_NAME.Domain/$SOLUTION_NAME.Domain.csproj"
dotnet add "./$SOLUTION_NAME.Infra.IoC/$SOLUTION_NAME.Infra.IoC.csproj" reference "./$SOLUTION_NAME.Domain/$SOLUTION_NAME.Domain.csproj" "./$SOLUTION_NAME.Infra.Data/$SOLUTION_NAME.Infra.Data.csproj" "./$SOLUTION_NAME.Infra.Data/$SOLUTION_NAME.Infra.Data.csproj" "./$SOLUTION_NAME.Application/$SOLUTION_NAME.Application.csproj"
dotnet add "./$SOLUTION_NAME.Domain.Tests/$SOLUTION_NAME.Domain.Tests.csproj" reference "./$SOLUTION_NAME.Domain/$SOLUTION_NAME.Domain.csproj"