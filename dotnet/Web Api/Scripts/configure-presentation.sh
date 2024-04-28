#!/bin/bash

project_name=${1:-Garbiati}

# Update the Program.cs in the Api project
cat > "$project_name.Api/Program.cs" <<EOL
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
mkdir -p "$project_name.Api/Properties"
cat > "$project_name.Api/Properties/launchSettings.json" <<EOL
{
  "profiles": {
    "$project_name.Api": {
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