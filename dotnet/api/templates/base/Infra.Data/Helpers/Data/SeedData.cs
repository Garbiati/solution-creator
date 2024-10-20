using {{SOLUTION_NAME}}.Domain.Entities;
using {{SOLUTION_NAME}}.Infra.Data.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;

namespace {{SOLUTION_NAME}}.Infra.Data.Helpers.Data
{
    public static class SeedData
    {
        public static void Initialize(ApplicationDbContext context)
        {
            if (!context.Examples.Any())
            {
                var random = new Random();

                for (int i = 0; i < 10; i++)
                {
                    var example = new Example
                    {
                        Id = Guid.NewGuid(),
                        StringExample = $"Example of string field {i + 1}",
                        StringExampleWithMaxLenght = $"Example with max length {i + 1}",
                        TextExample = $"Example of text field {i + 1}",
                        StringNullableExample = random.NextDouble() < 0.5 ? null : $"Example of nullable string field {i + 1}",
                        DateTimeOffsetExample = DateTimeOffset.UtcNow.AddDays(random.Next(1, 365)), // Convertendo para UTC
                        DateTimeOffsetNullableExample = random.NextDouble() < 0.5 ? null : (DateTimeOffset?)DateTimeOffset.UtcNow.AddDays(random.Next(1, 365)), // Convertendo para UTC
                        DateTimeExample = DateTime.UtcNow.AddDays(random.Next(1, 365)), // Convertendo para UTC
                        DateTimeNullableExample = random.NextDouble() < 0.5 ? null : (DateTime?)DateTime.UtcNow.AddDays(random.Next(1, 365)), // Convertendo para UTC
                        IntExample = RandomNumberGenerator.GetInt32(1, 100),
                        IntNullExample = random.NextDouble() < 0.5 ? null : (int?)RandomNumberGenerator.GetInt32(1, 100),
                        LongExample = random.NextInt64(),
                        LongNullExample = random.NextDouble() < 0.5 ? null : (long?)random.NextInt64(),
                        DecimalExample = new decimal(random.NextDouble() * (9999999999999999.99 - 0.01) + 0.01),
                        DecimalNullExample = random.NextDouble() < 0.5 ? null : (decimal?)(new decimal(random.NextDouble() * (9999999999999999.99 - 0.01) + 0.01)),
                        EnumExample = (Domain.Enums.ExampleEnum)random.Next(0, Enum.GetValues(typeof(Domain.Enums.ExampleEnum)).Length),
                        ExampleItems = GenerateExampleItems(random, 3) // Gerar 3 itens por exemplo
                    };

                    context.Add(example);
                }

                context.SaveChanges();
            }
        }

        private static List<ExampleItem> GenerateExampleItems(Random random, int count)
        {
            var items = new List<ExampleItem>();
            for (int i = 0; i < count; i++)
            {
                items.Add(new ExampleItem
                {
                    Name = $"Example Item {i + 1} string field",
                    Description = $"Description {i + 1} of Example Item string field",
                    Quantity = random.Next(1, 10)
                });
            }
            return items;
        }
    }
}
