using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WebApplication1.Entities;

[Table("Products")]
public class ProductEntity {
	[Key]
	[DatabaseGenerated(DatabaseGeneratedOption.Identity)]
	public Guid Id { get; set; } = Guid.NewGuid();

	public string Title { get; set; }
	public string? Color { get; set; }
	public int Stock { get; set; }
	public long Price { get; set; }
}