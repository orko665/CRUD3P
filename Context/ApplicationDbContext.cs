using Microsoft.EntityFrameworkCore;

namespace CRUD.Context
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
                : base(options)
        {
        }

        public DbSet<Model.Dto.ClienteDto> Clientes { get; set; }
        public DbSet<Model.Dto.FacturaDto> Facturas { get; set; }



        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

        }
    }
}
