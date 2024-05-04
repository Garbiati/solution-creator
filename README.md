# Solution Creator

## Introduction

**Solution Creator** is a personal project that uses shell scripts to generate pre-configured solutions for developing Web APIs and, in the future, web applications. Currently, my focus is on creating Web APIs in .NET, using technologies such as Entity Framework, PostgreSQL, versioning, and documentation with Swagger.

## Environment

The current scripts are based on .NET 8.0 and use Ubuntu 22.04 as the operating system, but in an upcoming update, I plan to parameterize the SDK version and use Docker to execute the script and generate the solution, removing any operating system dependencies or environment configuration.

## Requirements

- Docker
- Docker Compose
- .NET SDK 8.0 or higher
- Git
- Visual Studio Code (recommended for development)

## Usage

1. Clone this repository:

    ```bash
    git clone https://github.com/Garbiati/solution-creator
    ```

2. Navigate to the API directory:

    ```bash
    cd solution-creator/dotnet/api
    ```

3. Execute the script:

    ```bash
    ./run.sh YourSolutionName
    ```

    Ensure the script is executable. If necessary, run `chmod +x run.sh` to make it executable.

4. After the script finishes, a new Visual Studio Code window will open with the root directory of the created solution.

    In the current version of the script, it performs `docker-compose up`, setting up the PostgreSQL relational database and performing the migration of the entity framework.
