using Microsoft.EntityFrameworkCore;
using DotNetEnv;
using {{SOLUTION_NAME}}.Api.Extensions;
using {{SOLUTION_NAME}}.Infra.Data.Context;
using {{SOLUTION_NAME}}.Infra.Data.Helpers.Data;
using {{SOLUTION_NAME}}.Infra.IoC;

var builder = WebApplication.CreateBuilder(args);

Env.Load("../.env");
builder.Configuration.AddEnvironmentVariables();

// Add services to the container.
builder.Services.AddControllers();
builder.Services.ConfigureSwagger();
builder.Services.ConfigureVersioning();
builder.Services.RegisterServices(builder.Configuration);
builder.Services.AddHealthChecks();

// Fetch the connection string from environment variables
var connectionString = builder.Configuration.GetConnectionString("DefaultConnection");
builder.Services.AddDbContext<ApplicationDbContext>(options =>
    options.UseNpgsql(connectionString));

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.ConfigureSwaggerUI();
    using var scope = app.Services.CreateScope();
    var dbContext = scope.ServiceProvider.GetRequiredService<ApplicationDbContext>();
    dbContext.Database.Migrate();
    SeedData.Initialize(dbContext);
}
app.UseHttpsRedirection();
app.UseRouting();
app.MapHealthChecks("/health");
app.MapControllers();

app.Run();
