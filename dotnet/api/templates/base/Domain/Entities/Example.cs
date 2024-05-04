using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using {{SOLUTION_NAME}}.Domain.Common;
using {{SOLUTION_NAME}}.Domain.Enums;
using {{SOLUTION_NAME}}.Domain.Validations;

namespace {{SOLUTION_NAME}}.Domain.Entities;

public class Example : BaseEntity
{
    [Required]
    [MaxLength(100)]
    public string Name { get; set; } = string.Empty;

    [MaxLength(1000)]
    public string Description { get; set; } = string.Empty;

    public string? Optional { get; set; }

    [Required]
    public DateTimeOffset StartAt { get; set; }

    [Required]
    public DateTimeOffset EndAt { get; set; }

    [Required]
    public decimal Price { get; set; }

    public ExampleEnum ExampleEnum { get; set; }


    public void IsValid()
    {
        DomainExceptionValidation.When(string.IsNullOrEmpty(Name), "Name is required");
        DomainExceptionValidation.When(StartAt > EndAt, "StartAt cannot be greater than EndAt");
        DomainExceptionValidation.When(Price <= 0, "Price must be greater than 0");
        DomainExceptionValidation.When(ExampleEnum == ExampleEnum.None, "ExampleEnum is required");
    }

}
