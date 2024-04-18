using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebApplication1.Entities;

namespace WebApplication1.Controllers;

[ApiController]
[Route("api/order")]
public class OrderController(AppDbContext dbContext) : Controller {

	[HttpPost]
	public async Task<ActionResult> Create(OrderCreateDto dto) {
		ProductEntity? product = 
			await dbContext.Products.FirstOrDefaultAsync(x => x.Id == dto.ProductId);
		if (product == null) {
			return NotFound(new {
				Message = "محصول یافت نشد"
			});
		}
		
		await dbContext.Orders.AddAsync(new OrderEntity {
			UserId = dto.UserId,
			Products = [product]
		});
		await dbContext.SaveChangesAsync();

		return Ok();

	}

	[HttpGet]
	public ActionResult<OrderReadDto> Read() {
		IEnumerable<OrderReadDto> orders = dbContext.Orders.Select(
			order => new OrderReadDto {
				Id = order.Id,
				User = order.User,
				Products = order.Products.Select(product => new ProductReadDto {
					Id = product.Id,
					Color = product.Color,
					Title = product.Title,
					Stock = product.Stock,
					Price = product.Price
				})
			});
		
		return Ok(orders);
	}
	
}