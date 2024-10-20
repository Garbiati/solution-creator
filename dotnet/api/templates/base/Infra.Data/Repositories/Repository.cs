using System.Linq.Expressions;
using Microsoft.EntityFrameworkCore;
using {{SOLUTION_NAME}}.Domain.Interfaces;
using {{SOLUTION_NAME}}.Infra.Data.Context;
using {{SOLUTION_NAME}}.Domain.Exceptions;

namespace {{SOLUTION_NAME}}.Infra.Data.Repositories;
public class Repository<T> : IRepository<T>
where T : class
{
    private readonly ApplicationDbContext _context;

    public Repository(ApplicationDbContext context)
        => _context = context;

    //Create
    public virtual async Task CreateAsync(T entity)
        => await _context.Set<T>().AddAsync(entity);

    public virtual async Task CreateRangeAsync(IEnumerable<T> entities)
        => await _context.Set<T>().AddRangeAsync(entities);

    // Read
    public virtual async Task<IEnumerable<T>> ReadAllAsync()
        => await _context.Set<T>().ToListAsync();

    public virtual async ValueTask<T> ReadByIdAsync(Guid id)
        => await _context.Set<T>().FindAsync(id)
            ?? throw new NotFoundException(typeof(T).Name, id);

    public virtual async Task<IEnumerable<T>> ReadByIdsAsync(IEnumerable<Guid> ids)
        => await _context.Set<T>().Where(e => ids.Contains(EF.Property<Guid>(e, "Id"))).ToListAsync();

    public async Task<IEnumerable<T>> ReadAllWithNavigationsAsync()
    {
        var query = _context.Set<T>().AsQueryable();
        var navigationProperties = _context.Model.FindEntityType(typeof(T))?.GetNavigations();
        if (navigationProperties != null)
        {
            foreach (var property in navigationProperties)
            {
                query = query.Include(property.Name);
            }
        }
        return await query.ToListAsync();
    }

    public async ValueTask<T> ReadByIdWithNavigationsAsync(Guid id)
    {
        var query = _context.Set<T>().AsQueryable();
        var navigationProperties = _context.Model.FindEntityType(typeof(T))?.GetNavigations();
        if (navigationProperties != null)
        {
            foreach (var property in navigationProperties)
            {
                query = query.Include(property.Name);
            }
        }
        return await query.FirstOrDefaultAsync(e => EF.Property<Guid>(e, "Id") == id)
            ?? throw new NotFoundException(typeof(T).Name, id);
    }

    public async Task<IEnumerable<T>> ReadByIdsWithNavigationsAsync(IEnumerable<Guid> ids)
    {
        var query = _context.Set<T>().AsQueryable();
        var navigationProperties = _context.Model.FindEntityType(typeof(T))?.GetNavigations();
        if (navigationProperties != null)
        {
            foreach (var property in navigationProperties)
            {
                query = query.Include(property.Name);
            }
        }
        return await query.Where(e => ids.Contains(EF.Property<Guid>(e, "Id"))).ToListAsync();
    }

    // Update
    public virtual void Update(T entity)
        => _context.Set<T>().Update(entity);

    public virtual void UpdateRange(IEnumerable<T> entities)
        => _context.Set<T>().UpdateRange(entities);

    // Delete
    public virtual void Remove(T entity)
        => _context.Set<T>().Remove(entity);

    public virtual void RemoveRange(IEnumerable<T> entities)
        => _context.Set<T>().RemoveRange(entities);

    // Where
    public virtual async Task<IEnumerable<T>> ReadWhereAsync(Expression<Func<T, bool>> predicate)
        => await _context.Set<T>().Where(predicate).ToListAsync();

    public virtual async Task<IEnumerable<T>> ReadWhereWithIncludeAsync(Expression<Func<T, bool>> predicate, params Expression<Func<T, object>>[] includeProperties)
        => await includeProperties.Aggregate(_context.Set<T>().Where(predicate), (current, includeProperty)
            => current.Include(includeProperty)).ToListAsync();

    //Count
    public virtual async ValueTask<int> CountAsync(Expression<Func<T, bool>> predicate)
        => await _context.Set<T>().CountAsync(predicate);

    public virtual async ValueTask<int> CountWithIncludeAsync(Expression<Func<T, bool>> predicate, params Expression<Func<T, object>>[] includeProperties)
        => await includeProperties.Aggregate(_context.Set<T>().Where(predicate), (current, includeProperty)
            => current.Include(includeProperty)).CountAsync();

    //Skip and Take
    public virtual async Task<List<T>> ReadPagedAsync(Expression<Func<T, bool>> predicate, int pageNumber, int pageSize)
        => await _context.Set<T>()
                    .Where(predicate)
                    .Skip((pageNumber - 1) * pageSize)
                    .Take(pageSize)
                    .ToListAsync();

    public virtual async Task<List<T>> ReadPagedWithIncludeAsync(Expression<Func<T, bool>> predicate, int pageNumber, int pageSize, params Expression<Func<T, object>>[] includeProperties)
        => await includeProperties.Aggregate(_context.Set<T>().Where(predicate), (current, includeProperty)
            => current.Include(includeProperty))
                .Skip((pageNumber - 1) * pageSize)
                .Take(pageSize)
                .ToListAsync();

    // First
    public virtual async ValueTask<T> FirstOrDefaultAsync(Expression<Func<T, bool>> predicate)
        => await _context.Set<T>().FirstOrDefaultAsync(predicate)
            ?? throw new NotFoundException(typeof(T).Name);

    public virtual async ValueTask<T> FirstOrDefaultWithIncludeAsync(Expression<Func<T, bool>> predicate, params Expression<Func<T, object>>[] includeProperties)
        => await includeProperties.Aggregate(_context.Set<T>().Where(predicate), (current, includeProperty)
            => current.Include(includeProperty)).FirstOrDefaultAsync()
                ?? throw new NotFoundException(typeof(T).Name);

    //Exists
    public virtual async ValueTask<bool> HasAnyAsync()
        => await _context.Set<T>().AnyAsync();

    public virtual async ValueTask<bool> ExistsAsync(Guid id)
        => await _context.Set<T>().AnyAsync(e => EF.Property<Guid>(e, "Id") == id);

    public virtual async ValueTask<bool> HasAnyAsync(Expression<Func<T, bool>> predicate)
        => await _context.Set<T>().AnyAsync(predicate);

    public virtual async ValueTask<bool> HasAnyWithIncludeAsync(Expression<Func<T, bool>> predicate, params Expression<Func<T, object>>[] includeProperties)
        => await includeProperties.Aggregate(_context.Set<T>().Where(predicate), (current, includeProperty)
            => current.Include(includeProperty)).AnyAsync();


}