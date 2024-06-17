using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using WebApplication1.Entities;

namespace WebApplication1.Controllers;

[ApiController]
[Route("api/user")]
public class UserController(AppDbContext dbContext, HttpContextAccessor accessor) : ControllerBase {
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
	[Authorize]
	public ActionResult<IEnumerable<UserEntity>> Read() {
		return Ok(dbContext.Users);
	}


	[HttpGet("GetProfile")]
	[Authorize]
	public ActionResult<UserReadDto> ReadProfile() {
		return Ok();
	}

	[HttpPost("register")]
	public async Task<ActionResult<UserReadDto>> Register(RegisterDto dto) {
		UserEntity user = new() {
			BirthDate = dto.BirthDate,
			UserName = dto.UserName,
			Password = dto.Password
		};

		await dbContext.AddAsync(user);
		await dbContext.SaveChangesAsync();

		JwtSecurityToken token = CreateToken(user);

		UserReadDto readDto = new() {
			BirthDate = user.BirthDate,
			UserName = user.UserName,
			Id = user.Id,
			Token = new JwtSecurityTokenHandler().WriteToken(token),
		};

		return Ok(readDto);
	}

	[HttpPost("login")]
	public async Task<ActionResult<UserReadDto>> Login(LoginDto dto) {
		UserEntity? user = await dbContext.Users
			.FirstOrDefaultAsync(x => dto.UserName == x.UserName && dto.Password == x.Password);
		if (user == null) {
			return NotFound();
		}
		
		JwtSecurityToken token = CreateToken(user);

		UserReadDto readDto = new() {
			BirthDate = user.BirthDate,
			UserName = user.UserName,
			Id = user.Id,
			Token = new JwtSecurityTokenHandler().WriteToken(token),
		};

		return Ok(readDto);
	}


	private static JwtSecurityToken CreateToken(UserEntity user) {
		List<Claim> claims = [
			new Claim(JwtRegisteredClaimNames.Name, user.Id.ToString()),
			new Claim(ClaimTypes.Name, user.UserName),
			new Claim(ClaimTypes.DateOfBirth, user.BirthDate.ToString()),
		];
		SymmetricSecurityKey key = new("SinaMN75SinaMN75SinaMN75SinaMN75SinaMN75"u8.ToArray());
		SigningCredentials creds = new(key, SecurityAlgorithms.HmacSha256);
		JwtSecurityToken token = new(
			issuer: "SinaMN75SinaMN75SinaMN75SinaMN75SinaMN75",
			audience: "SinaMN75SinaMN75SinaMN75SinaMN75SinaMN75",
			claims: claims,
			expires: DateTime.UtcNow.AddMinutes(20),
			signingCredentials: creds
		);
		return token;
	}
}