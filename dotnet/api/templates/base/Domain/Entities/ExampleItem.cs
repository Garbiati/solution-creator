using System;
using {{SOLUTION_NAME}}.Domain.Common;

namespace {{SOLUTION_NAME}}.Domain.Entities;
public class ExampleItem : BaseEntity
{
    public string Name { get; set; } = string.Empty;
    public string Description { get; set; } = string.Empty;
    public int Quantity { get; set; } = 0;
    public Guid ExampleId { get; set; }
    public virtual Example? Example { get; set; }
}
