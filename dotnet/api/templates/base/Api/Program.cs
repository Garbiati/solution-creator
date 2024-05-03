using Microsoft.EntityFrameworkCore;
using {{PROJECT_NAME}}.Api.Extensions;
using {{PROJECT_NAME}}.Infra.Data.Context;
using {{PROJECT_NAME}}.Infra.Data.Helpers.Data;
using {{PROJECT_NAME}}.Infra.IoC;


var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllers();
builder.Services.ConfigureSwagger();
builder.Services.ConfigureVersioning();
builder.Services.RegisterServices(builder.Configuration);
builder.Services.AddHealthChecks();

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
