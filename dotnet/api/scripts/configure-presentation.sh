#!/bin/bash

# Check if PROJECT_DIRECTORY is set
if [ -z "$PROJECT_DIRECTORY" ]; then
    echo "Error: PROJECT_DIRECTORY is not set."
    exit 1
fi

# Navigate to the project directory
cd "$PROJECT_DIRECTORY"

# Set the project name
PROJECT_NAME=${1:-Garbiati}

# Update the Program.cs in the Api project
cat > "$PROJECT_NAME.Api/Program.cs" <<EOL
var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
ConfigureServices(builder.Services);

var app = builder.Build();

// Configure the HTTP request pipeline.
ConfigurePipeline(app);

app.Run();

void ConfigureServices(IServiceCollection services)
{
    services.AddEndpointsApiExplorer();
    services.AddSwaggerGen();
    services.AddHealthChecks();
}

void ConfigurePipeline(WebApplication app)
{
    if (app.Environment.IsDevelopment())
    {
        app.UseSwagger();
        app.UseSwaggerUI();
    }
    app.UseHttpsRedirection();
    app.MapHealthChecks("/health");
}
EOL
echo "Updated Program.cs in the Api project."

# Update the launchSettings.json in the Api project
mkdir -p "$PROJECT_NAME.Api/Properties"
cat > "$PROJECT_NAME.Api/Properties/launchSettings.json" <<EOL
{
  "profiles": {
    "$PROJECT_NAME.Api": {
      "commandName": "Project",
      "launchBrowser": true,
      "launchUrl": "swagger",
      "applicationUrl": "https://localhost:5001;http://localhost:5000",
      "environmentVariables": {
        "ASPNETCORE_ENVIRONMENT": "Development"
      }
    }
  }
}
EOL
echo "Updated launchSettings.json in the Api project."

echo "done"