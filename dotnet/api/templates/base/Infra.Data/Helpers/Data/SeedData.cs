using {{SOLUTION_NAME}}.Domain.Entities;
using {{SOLUTION_NAME}}.Infra.Data.Context;
using System;

namespace {{SOLUTION_NAME}}.Infra.Data.Helpers.Data
{
    public static class SeedData
    {
        public static void Initialize(ApplicationDbContext context)
        {
            if (!context.Examples.Any())
            {
                var example = new Example
                {
                    Name = "Example 1",
                    Description = "Description 1",
                    StartAt = DateTimeOffset.UtcNow,
                    EndAt = DateTimeOffset.UtcNow,
                    Price = 10,
                    ExampleEnum = Domain.Enums.ExampleEnum.Value1
                };


                var example2 = new Example
                {
                    Name = "Example 2",
                    Description = "Description 2",
                    StartAt = DateTimeOffset.UtcNow,
                    EndAt = DateTimeOffset.UtcNow,
                    Price = 20,
                    ExampleEnum = Domain.Enums.ExampleEnum.Value2
                };

                var example3 = new Example
                {
                    Name = "Example 3",
                    Description = "Description 3",
                    StartAt = DateTimeOffset.UtcNow,
                    EndAt = DateTimeOffset.UtcNow,
                    Price = 30,
                    ExampleEnum = Domain.Enums.ExampleEnum.Value3
                };

                var example4 = new Example
                {
                    Name = "Example 4",
                    Description = "Description 4",
                    StartAt = DateTimeOffset.UtcNow,
                    EndAt = DateTimeOffset.UtcNow,
                    Price = 40,
                    ExampleEnum = Domain.Enums.ExampleEnum.Value3
                };

                var example5 = new Example
                {
                    Name = "Example 5",
                    Description = "Description 5",
                    Optional = "Optional 5",
                    StartAt = DateTimeOffset.UtcNow,
                    EndAt = DateTimeOffset.UtcNow,
                    Price = 50,
                    ExampleEnum = Domain.Enums.ExampleEnum.Value2
                };

                context.Examples.Add(example);
                context.Examples.Add(example2);
                context.Examples.Add(example3);
                context.Examples.Add(example4);
                context.Examples.Add(example5);

                context.SaveChanges();
            }
        }
    }
}
