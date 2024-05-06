using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace WebApplication1.Entities;

[Table("Users")]
public class UserEntity {
	[Key]
	[DatabaseGenerated(DatabaseGeneratedOption.Identity)]
	public Guid Id { get; set; } = Guid.NewGuid();

	public string UserName { get; set; }
	public DateTime BirthDate { get; set; }
	public string Password { get; set; }

	[JsonIgnore]
	public IEnumerable<OrderEntity>? Orders { get; set; }
}

public class RegisterDto {
	public string UserName { get; set; }
	public string Password { get; set; }
	public DateTime BirthDate { get; set; }
}

public class LoginDto {
	public string UserName { get; set; }
	public string Password { get; set; }
}


public class UserCreateDto {
	public string UserName { get; set; }
	public DateTime BirthDate { get; set; }
}

public class UserReadDto {
	public Guid Id { get; set; }
	public string UserName { get; set; }
	public DateTime BirthDate { get; set; }
	public string? Token { get; set; }
}