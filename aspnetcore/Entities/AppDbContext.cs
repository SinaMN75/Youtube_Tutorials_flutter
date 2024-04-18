using Microsoft.EntityFrameworkCore;

namespace WebApplication1.Entities;

public class AppDbContext(DbContextOptions options) : DbContext(options) {
	public DbSet<ProductEntity> Products { get; set; }
	public DbSet<OrderEntity> Orders { get; set; }
	public DbSet<UserEntity> Users { get; set; }
}