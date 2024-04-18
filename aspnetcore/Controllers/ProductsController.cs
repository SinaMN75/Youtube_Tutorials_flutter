using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.ChangeTracking;
using WebApplication1.Entities;

namespace WebApplication1.Controllers;

[ApiController]
[Route("api/products")]
public class ProductsController(AppDbContext dbContext) : ControllerBase {

	[HttpPost]
	public async Task<ActionResult<ProductEntity>> Create(ProductEntity dto) {
		EntityEntry<ProductEntity> product = await dbContext.AddAsync(dto);
		await dbContext.SaveChangesAsync();
		return Ok(product.Entity);
	}

	[HttpGet]
	public ActionResult<IEnumerable<ProductEntity>> Read() {
		return dbContext.Products;
	}

	[HttpGet("{id:guid}")]
	public async Task<ActionResult<ProductEntity>> ReadById(Guid id) {
		ProductEntity product = await dbContext.Products.FirstOrDefaultAsync(x => x.Id == id);
		if (product == null) return NotFound();
		return Ok(product);
	}

	[HttpPut]
	public async Task<ActionResult<ProductEntity>> Update(ProductEntity dto) {
		ProductEntity oldProduct =
			await dbContext.Products.FirstOrDefaultAsync(x => x.Id == dto.Id);
		
		if (oldProduct == null) return NotFound();
		
		oldProduct.Color = dto.Color;
		oldProduct.Price = dto.Price;
		oldProduct.Title = dto.Title;

		dbContext.Update(oldProduct);
		await dbContext.SaveChangesAsync();
		return Ok(oldProduct);
	}

	[HttpDelete("{id:guid}")]
	public async Task<ActionResult> Delete(Guid id) {
		ProductEntity product =
			await dbContext.Products.FirstOrDefaultAsync(x => x.Id == id);
		
		if (product == null) return NotFound();

		dbContext.Remove(product);
		await dbContext.SaveChangesAsync();
		return NoContent();
	}
}