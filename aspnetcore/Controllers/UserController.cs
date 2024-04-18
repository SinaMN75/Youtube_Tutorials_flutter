using Microsoft.AspNetCore.Mvc;
using WebApplication1.Entities;

namespace WebApplication1.Controllers;

[ApiController]
[Route("api/user")]
public class UserController(AppDbContext dbContext) : ControllerBase {
	
	[HttpPost]
	public async Task<IActionResult> Create(UserCreateDto dto) {
		UserEntity user = new() {
			UserName = dto.UserName,
			BirthDate = dto.BirthDate
		};
		await dbContext.AddAsync(user);
		await dbContext.SaveChangesAsync();
		return Ok();
	}

	[HttpGet]
	public ActionResult<IEnumerable<UserEntity>> Read() {
		return Ok(dbContext.Users);
	}
}