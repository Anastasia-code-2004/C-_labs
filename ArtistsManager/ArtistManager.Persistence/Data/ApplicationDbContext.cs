using Microsoft.EntityFrameworkCore;

namespace ArtistsManager.Persistence.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options) 
        // вызов конструктора базового класса
        {
            Database.EnsureCreated();
        }

        public DbSet<Artist> Artists { get; set; }
        public DbSet<Song> Songs { get; set; }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Artist>()
            .OwnsOne<Person>(t => t.PersonalData);

        }
    }
}
