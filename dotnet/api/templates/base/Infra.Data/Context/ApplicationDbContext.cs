using Microsoft.EntityFrameworkCore;
using {{SOLUTION_NAME}}.Domain.Entities;

namespace {{SOLUTION_NAME}}.Infra.Data.Context
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        { }

        public DbSet<Example> Examples { get; set; }

        public DbSet<ExampleItem> ExampleItems { get; set; }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);
            builder.ApplyConfigurationsFromAssembly(typeof(ApplicationDbContext).Assembly);
        }
    }
}
