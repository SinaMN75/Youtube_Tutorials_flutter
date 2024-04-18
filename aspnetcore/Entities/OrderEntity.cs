using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WebApplication1.Entities;

[Table("Orders")]
public class OrderEntity {
	[Key]
	[DatabaseGenerated(DatabaseGeneratedOption.Identity)]
	public Guid Id { get; set; }

	public UserEntity User { get; set; }
	public Guid UserId { get; set; }

	
	public IEnumerable<ProductEntity> Products { get; set; }
}

public class OrderCreateDto {
	public Guid UserId { get; set; }
	public Guid ProductId { get; set; }
}

public class OrderReadDto {
	public Guid Id { get; set; }
	public UserEntity User { get; set; }
	public IEnumerable<ProductReadDto> Products { get; set; }
}
