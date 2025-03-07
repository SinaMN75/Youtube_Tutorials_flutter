using Microsoft.EntityFrameworkCore;
using UserManagement.Entities;

namespace UserManagement;

public class AppDbContext(DbContextOptions options) : DbContext(options) {
	
	public DbSet<UserEntity> Users { get; set; } = null!;
	public DbSet<SchoolEntity> School { get; set; } = null!;
	public DbSet<ClassEntity> Class { get; set; } = null!;
	
}