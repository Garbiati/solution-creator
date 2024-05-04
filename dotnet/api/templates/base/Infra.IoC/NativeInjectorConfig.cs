using {{SOLUTION_NAME}}.Application.Interfaces;
using {{SOLUTION_NAME}}.Application.Mappings;
using {{SOLUTION_NAME}}.Application.Services;
using {{SOLUTION_NAME}}.Domain.Interfaces;
using {{SOLUTION_NAME}}.Infra.Data.Context;
using {{SOLUTION_NAME}}.Infra.Data.Repositories;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;


namespace {{SOLUTION_NAME}}.Infra.IoC
{
    public static class NativeInjectorConfig
{
    public static void RegisterServices(this IServiceCollection services, IConfiguration configuration)
    {
        services.AddDbContext<ApplicationDbContext>(options =>
            options.UseNpgsql(configuration.GetConnectionString("DefaultConnection")));

        services.AddScoped<IExampleService, ExampleService>();
        services.AddScoped<IExampleRepository, ExampleRepository>();

        services.AddAutoMapper(typeof(ExampleMappingProfile));

    }
}
}