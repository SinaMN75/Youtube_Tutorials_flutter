using Microsoft.EntityFrameworkCore.ChangeTracking;
using WebApplication1.Entities;
using WebApplication1.Models;

namespace WebApplication1.Repositories;

public interface IProductRepository {
	Task<GenericResponse<ProductReadDto>> Create(ProductCreateDto dto);
	Task<GenericResponse<IEnumerable<ProductReadDto>>> Read();
}

public class MongoProductRepository(AppDbContext dbContext) : IProductRepository {
	public async Task<GenericResponse<ProductReadDto>> Create(ProductCreateDto dto) {
		if (dto.Price == 0) {
			return new GenericResponse<ProductReadDto> {
				Message = "قیمت نمیتواند ۰ باشد",
				StatusCode = 400
			};
		}

		ProductEntity entity = new() {
			Color = dto.Color,
			Title = dto.Title,
			Price = dto.Price,
			Stock = dto.Stock
		};
		
		EntityEntry<ProductEntity> product = await dbContext.AddAsync(entity);
		
		
		await dbContext.SaveChangesAsync();

		ProductReadDto readDto = new() {
			Color = product.Entity.Color,
			Title = product.Entity.Title,
			Price = product.Entity.Price,
			Stock = product.Entity.Stock,
			Id = product.Entity.Id,
			PriceString = $"{product.Entity.Price} دلار"
		};

		return new GenericResponse<ProductReadDto> {
			Result = readDto,
			StatusCode = 200
		};
	}

	public Task<GenericResponse<IEnumerable<ProductReadDto>>> Read() {
		throw new NotImplementedException();
	}
}

public class ProductRepository(AppDbContext dbContext) : IProductRepository {
	public async Task<GenericResponse<ProductReadDto>> Create(ProductCreateDto dto) {
		if (dto.Price == 0) {
			return new GenericResponse<ProductReadDto> {
				Message = "قیمت نمیتواند ۰ باشد",
				StatusCode = 400
			};
		}

		ProductEntity entity = new() {
			Color = dto.Color,
			Title = dto.Title,
			Price = dto.Price,
			Stock = dto.Stock
		};
		
		EntityEntry<ProductEntity> product = await dbContext.AddAsync(entity);
		
		
		await dbContext.SaveChangesAsync();

		ProductReadDto readDto = new() {
			Color = product.Entity.Color,
			Title = product.Entity.Title,
			Price = product.Entity.Price,
			Stock = product.Entity.Stock,
			Id = product.Entity.Id,
			PriceString = $"{product.Entity.Price} دلار"
		};

		return new GenericResponse<ProductReadDto> {
			Result = readDto,
			StatusCode = 200
		};
	}

	public Task<GenericResponse<IEnumerable<ProductReadDto>>> Read() {
		throw new NotImplementedException();
	}
}