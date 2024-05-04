using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using {{SOLUTION_NAME}}.Domain.Entities;

namespace {{SOLUTION_NAME}}.Infra.Data.EntitiesConfiguration;

public class ExampleConfiguration : IEntityTypeConfiguration<Example>
{
    public void Configure(EntityTypeBuilder<Example> builder)
    {
        builder.HasKey(t => t.Id);
        builder.Property(p => p.Name).HasMaxLength(100).IsRequired();
        builder.Property(p => p.Description).HasMaxLength(1000);
        builder.Property(p => p.Optional).HasMaxLength(100);
        builder.Property(p => p.StartAt).IsRequired();
        builder.Property(p => p.EndAt).IsRequired();
        builder.Property(p => p.Price).IsRequired();
        builder.Property(p => p.ExampleEnum).IsRequired().HasConversion<int>();

        builder.Property(p => p.CreatedAt)
               .IsRequired()
               .HasDefaultValueSql("CURRENT_TIMESTAMP")
               .ValueGeneratedOnAdd();

        builder.Property(p => p.UpdatedAt)
               .IsRequired(false)
               .ValueGeneratedOnUpdate();

        builder.Property(p => p.Active)
                       .IsRequired()
                       .HasDefaultValue(true);

        builder.Property(p => p.DisabledAt)
               .IsRequired(false);

        // Indexes
        builder.HasIndex(p => p.Name);
        builder.HasIndex(p => p.Active);
    }
}
