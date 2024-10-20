using {{SOLUTION_NAME}}.Application.Interfaces;
using {{SOLUTION_NAME}}.Application.Mappings;
using {{SOLUTION_NAME}}.Application.Services;

//using Heimdall.Application.Services;
using {{SOLUTION_NAME}}.Domain.Interfaces;
using {{SOLUTION_NAME}}.Infra.Data.Context;
using {{SOLUTION_NAME}}.Infra.Data.Repositories;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Reminder.Infra.Data.Repositories;


namespace {{SOLUTION_NAME}}.Infra.IoC
{
    public static class NativeInjectorConfig
    {
        public static void RegisterServices(this IServiceCollection services, IConfiguration configuration)
        {
            services.AddDbContext<ApplicationDbContext>(options =>
                options.UseNpgsql(configuration.GetConnectionString("DefaultConnection")));

            services.AddScoped<IUnitOfWork, UnitOfWork>();
            services.AddAutoMapper(typeof(MappingProfile));
            services.AddScoped(typeof(IRepository<>), typeof(Repository<>));
            services.AddScoped(typeof(IServiceBase<,,,>), typeof(ServiceBase<,,,>));
        }
    }
}