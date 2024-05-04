#!/bin/bash

# Create a Domain class library and add it to the solution
dotnet new classlib -n "$SOLUTION_NAME.Domain" -o "$SOLUTION_NAME.Domain"
dotnet sln add "./$SOLUTION_NAME.Domain/$SOLUTION_NAME.Domain.csproj"
print_info "Created Domain class library and added to the solution."

# Create a Web API project and add it to the solution
dotnet new webapi -n "$SOLUTION_NAME.Api"
dotnet sln add "./$SOLUTION_NAME.Api/$SOLUTION_NAME.Api.csproj"
print_info "Created Web API project and added to the solution."

# Create additional class libraries and add them to the solution
dotnet new classlib -n "$SOLUTION_NAME.Infra.Data" -o "$SOLUTION_NAME.Infra.Data"
dotnet sln add "./$SOLUTION_NAME.Infra.Data/$SOLUTION_NAME.Infra.Data.csproj"
print_info "Created Infra.Data class library and added to the solution."

dotnet new classlib -n "$SOLUTION_NAME.Infra.IoC" -o "$SOLUTION_NAME.Infra.IoC"
dotnet sln add "./$SOLUTION_NAME.Infra.IoC/$SOLUTION_NAME.Infra.IoC.csproj"
print_info "Created Infra.IoC class library and added to the solution."

dotnet new classlib -n "$SOLUTION_NAME.Application" -o "$SOLUTION_NAME.Application"
dotnet sln add "./$SOLUTION_NAME.Application/$SOLUTION_NAME.Application.csproj"
print_info "Created Application class library and added to the solution."

# Create a test project with xUnit and add it to the solution
dotnet new xunit -n "$SOLUTION_NAME.Domain.Tests" -o "$SOLUTION_NAME.Domain.Tests"
dotnet sln add "./$SOLUTION_NAME.Domain.Tests/$SOLUTION_NAME.Domain.Tests.csproj"
print_info "Created test project and added to the solution."