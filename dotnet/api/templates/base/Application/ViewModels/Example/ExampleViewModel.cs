using System;
using System.ComponentModel.DataAnnotations;
using {{PROJECT_NAME}}.Domain.Enums;

namespace {{PROJECT_NAME}}.Application.ViewModels.Example;

public class ExampleViewModel
{
    public Guid Id { get; set; }

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

    [Required]
    public bool Active { get; set; } = true;

    public ExampleEnum ExampleEnum { get; set; }

}
