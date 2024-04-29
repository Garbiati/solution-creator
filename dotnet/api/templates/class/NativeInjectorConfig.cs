using {{ PROJECT_NAME}}.Application.Interfaces;
using {{ PROJECT_NAME}}.Application.Mappings;
using {{ PROJECT_NAME}}.Application.Services;
using {{ PROJECT_NAME}}.Domain.Interfaces;
using {{ PROJECT_NAME}}.Infra.Data.Context;
using {{ PROJECT_NAME}}.Infra.Data.Repositories;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;


namespace {{PROJECT_NAME}}.Infra.IoC
{
    public static class NativeInjectorConfig
{
    public static void RegisterServices(this IServiceCollection services, IConfiguration configuration)
    {
        services.AddDbContext<ApplicationDbContext>(options =>
            options.UseNpgsql(configuration.GetConnectionString("DefaultConnection")));

        services.AddAutoMapper(typeof(MappingProfile));
    }
}
}