using Microsoft.AspNetCore.Mvc;

namespace {{PROJECT_NAME}}.Api.Extensions;

public static class ApiVersioningSetup
{
    public static void ConfigureVersioning(this IServiceCollection services)
    {

        services.AddVersionedApiExplorer(options =>
        {
            options.GroupNameFormat = "'v'VVV";
            options.SubstituteApiVersionInUrl = true;
        });

        services.AddApiVersioning(options =>
        {
            options.DefaultApiVersion = new ApiVersion(1, 0);
            options.AssumeDefaultVersionWhenUnspecified = true;
            options.ReportApiVersions = true;
        });
    }
}