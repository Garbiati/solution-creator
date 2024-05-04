using System.Reflection;
using Microsoft.AspNetCore.Mvc.ApiExplorer;
using Microsoft.OpenApi.Models;

namespace {{SOLUTION_NAME}}.Api.Extensions;

public static class SwaggerSetup
{
    public static void ConfigureSwagger(this IServiceCollection services)
    {
        services.AddEndpointsApiExplorer();
        services.AddSwaggerGen(options =>
        {
            options.SwaggerDoc("v1", new OpenApiInfo
            {
                Title = "{{SOLUTION_NAME}} Api",
                Version = "v1"
            });

            options.SwaggerDoc("v2", new OpenApiInfo
            {
                Title = "{{SOLUTION_NAME}} Api",
                Version = "v2"
            });

            // var xmlFile = $"{Assembly.GetExecutingAssembly().GetName().Name}.xml";
            // var xmlPath = Path.Combine(AppContext.BaseDirectory, xmlFile);
            // options.IncludeXmlComments(xmlPath);
        });
    }
    public static void ConfigureSwaggerUI(this WebApplication app)
    {
        app.UseSwagger();
        app.UseSwaggerUI(options =>
        {
            var apiVersionProvider = app.Services.GetRequiredService<IApiVersionDescriptionProvider>();
            if (apiVersionProvider == null)
            {
                throw new InvalidOperationException("IApiVersionDescriptionProvider não está registrado.");
            }
            foreach (var description in apiVersionProvider.ApiVersionDescriptions)
            {
                options.SwaggerEndpoint($"/swagger/{description.GroupName}/swagger.json", $"API {description.GroupName}");
            }
            options.RoutePrefix = "swagger";
        });
    }
}
