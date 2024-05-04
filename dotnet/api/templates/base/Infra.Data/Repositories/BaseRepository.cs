using {{SOLUTION_NAME}}.Domain.Common;
using {{SOLUTION_NAME}}.Domain.Interfaces;
using {{SOLUTION_NAME}}.Infra.Data.Context;
using Microsoft.EntityFrameworkCore;

namespace {{SOLUTION_NAME}}.Persistence.Repositories;

public class BaseRepository<T> : IBaseRepository<T> where T : BaseEntity
{
    protected readonly ApplicationDbContext Context;

    public BaseRepository(ApplicationDbContext context)
    {
        Context = context;
    }

    public async Task CreateAsync(T entity)
    {
        await Context.Set<T>().AddAsync(entity);
        await Context.SaveChangesAsync();
    }

    public async Task<T> GetAsync(Guid id)
    {
        return await Context.Set<T>().FindAsync(id) ?? throw new ArgumentNullException(nameof(id));
    }

    public async Task<List<T>> GetAllAsync()
    {
        return await Context.Set<T>().ToListAsync();
    }

    public async Task UpdateAsync(T entity)
    {
        Context.Set<T>().Update(entity);
        await Context.SaveChangesAsync();
    }

    public Task DeleteAsync(T entity)
    {
        Context.Set<T>().Remove(entity);
        return Context.SaveChangesAsync();
    }
}
