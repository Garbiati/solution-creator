using Microsoft.EntityFrameworkCore;
using {{PROJECT_NAME}}.Domain.Entities;

namespace {{PROJECT_NAME}}.Infra.Data.Context
{
    public class ApplicationDbContext : DbContext
{
    public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
        : base(options)
    { }

    protected override void OnModelCreating(ModelBuilder builder)
    {
        base.OnModelCreating(builder);
        builder.ApplyConfigurationsFromAssembly(typeof(ApplicationDbContext).Assembly);
    }
}
}
