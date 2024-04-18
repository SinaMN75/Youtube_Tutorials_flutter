using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

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
	

	[JsonIgnore]
	public IEnumerable<OrderEntity> Orders { get; set; }
}

public class ProductCreateDto {
	public string Title { get; set; }
	public string? Color { get; set; }
	public int Stock { get; set; }
	public long Price { get; set; }
}

public class ProductReadDto {
	public Guid Id { get; set; }
	public string Title { get; set; }
	public string? Color { get; set; }
	public int Stock { get; set; }
	public long Price { get; set; }
	
	public string PriceString { get; set; }
}