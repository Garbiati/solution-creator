#!/bin/bash

# Create a Domain class library and add it to the solution
dotnet new classlib -n "$PROJECT_NAME.Domain" -o "$PROJECT_NAME.Domain"
dotnet sln add "./$PROJECT_NAME.Domain/$PROJECT_NAME.Domain.csproj"
print_info "Created Domain class library and added to the solution."

# Create a Web API project and add it to the solution
dotnet new webapi -n "$PROJECT_NAME.Api"
dotnet sln add "./$PROJECT_NAME.Api/$PROJECT_NAME.Api.csproj"
print_info "Created Web API project and added to the solution."

# Create additional class libraries and add them to the solution
dotnet new classlib -n "$PROJECT_NAME.Infra.Data" -o "$PROJECT_NAME.Infra.Data"
dotnet sln add "./$PROJECT_NAME.Infra.Data/$PROJECT_NAME.Infra.Data.csproj"
print_info "Created Infra.Data class library and added to the solution."

dotnet new classlib -n "$PROJECT_NAME.Infra.IoC" -o "$PROJECT_NAME.Infra.IoC"
dotnet sln add "./$PROJECT_NAME.Infra.IoC/$PROJECT_NAME.Infra.IoC.csproj"
print_info "Created Infra.IoC class library and added to the solution."

dotnet new classlib -n "$PROJECT_NAME.Application" -o "$PROJECT_NAME.Application"
dotnet sln add "./$PROJECT_NAME.Application/$PROJECT_NAME.Application.csproj"
print_info "Created Application class library and added to the solution."

# Create a test project with xUnit and add it to the solution
dotnet new xunit -n "$PROJECT_NAME.Domain.Tests" -o "$PROJECT_NAME.Domain.Tests"
dotnet sln add "./$PROJECT_NAME.Domain.Tests/$PROJECT_NAME.Domain.Tests.csproj"
print_info "Created test project and added to the solution."