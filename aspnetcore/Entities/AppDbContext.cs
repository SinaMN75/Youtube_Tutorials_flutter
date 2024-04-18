using Microsoft.EntityFrameworkCore;

namespace WebApplication1.Entities;

public class AppDbContext(DbContextOptions options) : DbContext(options) {
	public DbSet<ProductEntity> Products { get; set; }
	
}