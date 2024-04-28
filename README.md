# Project Starter Scripts

Welcome to the Project Starter Scripts repository. This repository contains various scripts designed to initiate different projects with distinct approaches. The goal is to provide reusable templates that follow different architectures and design patterns.

## Available Scripts

### Clean Architecture + Domain-Driven Design (DDD)

The first script in this repository generates a .NET solution that follows Clean Architecture and Domain-Driven Design (DDD) principles. It creates a structure with multiple projects representing key components of the architecture.

### Features of the Clean Architecture + DDD Script
- **Domain**: Contains domain entities, interfaces, and validation logic.
- **Application**: Includes application logic, interfaces, mappings, and services.
- **Infra.Data**: Encompasses database configurations, Entity Framework Core repositories, and data contexts.
- **Infra.IoC**: Manages dependency injection and references between projects.
- **Api**: Provides the Web API for external client communication.
- **Domain.Tests**: Contains automated tests using xUnit.

## How to Use

To use the Clean Architecture + DDD script, follow these steps:

1. **Run the Script**
   - Execute the script with a custom project name or use the default name. It will create a .NET solution with the specified architecture.

2. **Set Up HTTPS Certificates**
   - Trust the .NET development HTTPS certificates by running `dotnet dev-certs https --trust`.

3. **Build and Run the Solution**
   - Build the solution with `dotnet build`.
   - Start the Web API with `dotnet run --project <SOLUTION_NAME>.Api`.

4. **Access Swagger Documentation**
   - Once the API is running, access the Swagger documentation at `http://localhost:5000/swagger`.

## Contributing

Contributions are welcome! If you'd like to contribute to this repository, follow these steps:

1. Fork the repository.
2. Create a branch for your contribution.
3. Make your changes and push them to GitHub.
4. Create a pull request for review.

## License

This project is licensed under the [LICENSE_NAME] license. For more details, refer to the license file in the repository.
