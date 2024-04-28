using Reminder.Application.Interfaces;
using Reminder.Application.Mappings;
using Reminder.Application.Services;
using Reminder.Domain.Interfaces;
using Reminder.Infra.Data.Context;
using Reminder.Infra.Data.Repositories;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;


namespace Reminder.Infra.IoC
{
    public static class NativeInjectorConfig
    {
        public static void RegisterServices(this IServiceCollection services, IConfiguration configuration)
        {
            services.AddDbContext<ApplicationDbContext>(options =>
                options.UseNpgsql(configuration.GetConnectionString("DefaultConnection")));

            services.AddScoped<IUnitOfWork, UnitOfWork>();

            services.AddScoped<IEventAggregateRepository, EventAggregateRepository>();
            services.AddScoped<IEventAggregateService, EventAggregateService>();

            services.AddAutoMapper(typeof(MappingProfile));
        }
    }
}