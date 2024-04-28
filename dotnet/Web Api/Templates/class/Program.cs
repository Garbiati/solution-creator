using Microsoft.EntityFrameworkCore;
using Reminder.Api.Extensions;
using Reminder.Infra.Data.Context;
using Reminder.Infra.Data.Helpers.Data;
using Reminder.Infra.IoC;


var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllers();
builder.Services.ConfigureSwagger();
builder.Services.ConfigureVersioning();
builder.Services.RegisterServices(builder.Configuration);
builder.Services.AddHealthChecks();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment() || app.Environment.IsEnvironment("DockerCompose"))
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


