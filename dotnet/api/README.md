# Solution Creator - .NET Web API

This script generates a .NET C# Web API project following clean architecture and Domain-Driven Design (DDD) principles. It includes a CRUD operation for a specific entity, which is saved in a PostgreSQL relational database. The project also provides a docker-compose file that sets up the environment with the necessary database.

## Prerequisites

Before running the script, make sure you have the following prerequisites installed:

- .NET SDK
- Docker
- Docker Compose

## Usage

1. Clone this repository:

    ```bash
    git clone https://github.com/Garbiati/solution-creator
    ```

2. Navigate to the project directory:

    ```bash
    cd solution-creator/dotnet/api
    ```

3. Run the script:

    ```bash
    dotnet run ProjectName
    ```

    This will generate the .NET Web API project with the necessary files and folder structure.

4. Set up the PostgreSQL database using Docker Compose:

    ```bash
    docker-compose up -d
    ```

    This will start the PostgreSQL container and create the necessary database.

5. Open the generated project in your favorite IDE or text editor.

6. Ensure that the database connection string is properly configured in your `appsettings.json` file. Below is an example of a PostgreSQL connection string:

    ```json
    "ConnectionStrings": {
    "DefaultConnection": "Host=localhost;Port=5432;Database=dbGarbiati;Username=uGarbiati;Password=pGarbiati"
    }
    ```

7. Build and run the project:

    ```bash
    dotnet build
    dotnet run
    ```

    The API will be accessible at `http://localhost:5000`.

## Contributing

Contributions are welcome! If you find any issues or have suggestions, please open an issue or submit a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
