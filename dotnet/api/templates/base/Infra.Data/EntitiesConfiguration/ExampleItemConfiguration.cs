using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using {{SOLUTION_NAME}}.Domain.Entities;

namespace {{SOLUTION_NAME}}.Infra.Data.EntitiesConfiguration;

public class ExampleItemConfiguration : BaseEntityConfiguration<ExampleItem>
{
       public override void Configure(EntityTypeBuilder<ExampleItem> builder)
       {
              base.Configure(builder);

              builder.Property(e => e.Name)
                     .IsRequired();

              builder.Property(e => e.Description)
                     .HasMaxLength(100)
                     .IsRequired();

              builder.Property(e => e.Quantity)
                     .IsRequired();

              //foreign key
              builder.HasOne(e => e.Example)
              .WithMany(e => e.ExampleItems)
              .HasForeignKey(e => e.ExampleId);


       }
}
