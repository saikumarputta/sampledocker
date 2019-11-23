using Microsoft.EntityFrameworkCore;
using sampledocker.Models;

namespace sampledocker.Data
{
    public class ApplicationDbContext : DbContext
    {
       public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options)
       {

       }
       public DbSet<Students> students{get; set;}
    }
}