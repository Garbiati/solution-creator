using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using {{SOLUTION_NAME}}.Domain.Entities;

namespace {{SOLUTION_NAME}}.Infra.Data.EntitiesConfiguration
{
       public class ExampleConfiguration : BaseEntityConfiguration<Example>
       {
              public override void Configure(EntityTypeBuilder<Example> builder)
              {
                     base.Configure(builder);

                     builder.Property(e => e.StringExample)
                            .IsRequired();

                     builder.Property(e => e.StringExampleWithMaxLenght)
                            .HasMaxLength(100)
                            .IsRequired();

                     builder.Property(e => e.StringNullableExample);

                     builder.Property(e => e.TextExample)
                            .HasColumnType("text");

                     builder.Property(e => e.DateTimeOffsetExample)
                            .IsRequired();

                     builder.Property(e => e.DateTimeOffsetNullableExample);

                     builder.Property(e => e.DateTimeExample)
                            .IsRequired();

                     builder.Property(e => e.DateTimeNullableExample);

                     builder.Property(e => e.IntExample)
                            .IsRequired();

                     builder.Property(e => e.IntNullExample);

                     builder.Property(e => e.LongExample)
                            .IsRequired();

                     builder.Property(e => e.LongNullExample);

                     builder.Property(e => e.DecimalExample)
                            .HasColumnType("decimal(18,2)")
                            .IsRequired();

                     builder.Property(e => e.DecimalNullExample)
                            .HasColumnType("decimal(18,2)");

                     builder.Property(e => e.EnumExample)
                            .IsRequired();

                     builder.HasMany(e => e.ExampleItems)
                            .WithOne(e => e.Example)
                            .HasForeignKey(e => e.ExampleId);
              }
       }
}
