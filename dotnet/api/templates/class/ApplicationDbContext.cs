using Microsoft.EntityFrameworkCore;
using Reminder.Domain.Entities;

namespace Reminder.Infra.Data.Context
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        { }

        public DbSet<Receiver> Receivers { get; set; }
        public DbSet<Issuer> Issuers { get; set; }
        public DbSet<Event> Events { get; set; }
        public DbSet<EventDetails> EventDetails { get; set; }
        public DbSet<Notification> Notifications { get; set; }
        public DbSet<NotificationLog> NotificationLogs { get; set; }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);
            builder.ApplyConfigurationsFromAssembly(typeof(ApplicationDbContext).Assembly);
        }
    }
}
