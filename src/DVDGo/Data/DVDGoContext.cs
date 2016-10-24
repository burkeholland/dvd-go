using Microsoft.EntityFrameworkCore;
using DVDGo.Models;

namespace DVDGo.Data
{
    public class DVDGoContext : DbContext {
        public DVDGoContext(DbContextOptions<DVDGoContext> options) 
            : base(options) { }

        public DbSet<Video> Videos { get; set; }
        public DbSet<Rating> Ratings { get; set; }
        public DbSet<Genre> Genres { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder) {
            modelBuilder.Entity<Video>().ToTable("Video");
            modelBuilder.Entity<Rating>().ToTable("Rating");
            modelBuilder.Entity<Genre>().ToTable("Genre");
        }
    }
}
