using System;
using System.ComponentModel.DataAnnotations;
using System.Diagnostics.CodeAnalysis;
using {{SOLUTION_NAME}}.Domain.Enums;

namespace {{SOLUTION_NAME}}.Application.DTO.Example;

public class ExampleDTO
{
    public Guid Id { get; set; }

    public string StringExample { get; set; } = string.Empty;

    public string StringExampleWithMaxLenght { get; set; } = string.Empty;

    public string? StringNullableExample { get; set; } = null;

    public string? TextExample { get; set; } = null;

    public DateTimeOffset DateTimeOffsetExample { get; set; }

    public DateTimeOffset? DateTimeOffsetNullableExample { get; set; }

    public DateTime DateTimeExample { get; set; }

    public DateTime? DateTimeNullableExample { get; set; }

    public int IntExample { get; set; }

    public int? IntNullExample { get; set; }

    public decimal DecimalExample { get; set; }

    public decimal? DecimalNullExample { get; set; }

    public long LongExample { get; set; }

    public long? LongNullExample { get; set; }

    public ExampleEnum EnumExample { get; set; }

    public ICollection<ExampleItemDTO>? ExampleItems { get; set; }
}
