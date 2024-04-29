#!/bin/bash

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
print_info "Updated Program.cs in the Api project."

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
print_info "Updated launchSettings.json in the Api project."