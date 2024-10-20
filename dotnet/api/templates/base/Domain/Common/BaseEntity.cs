using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace {{SOLUTION_NAME}}.Domain.Common;

public abstract class BaseEntity
{
    [Key]
    public Guid Id { get; set; }
    [Required]
    public DateTimeOffset CreatedAt { get; set; }
    public DateTimeOffset? UpdatedAt { get; set; }
    [Required]
    [DefaultValue(false)]
    public bool IsDeleted { get; set; } = false;
    public DateTimeOffset? DeletedAt { get; set; }
}