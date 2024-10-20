using System.ComponentModel.DataAnnotations;
using System.Diagnostics.CodeAnalysis;

namespace {{SOLUTION_NAME}}.Application.DTO.Example;
public class ExampleItemCreateDTO
{
    [Required]
    public Guid Id { get; set; }
    [Required]
    public string Name { get; set; } = string.Empty;
    [AllowNull]
    public string Description { get; set; } = string.Empty;
    [AllowNull]
    public int Quantity { get; set; } = 0;
}