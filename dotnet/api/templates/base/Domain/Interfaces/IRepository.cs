using System.Linq.Expressions;
namespace {{SOLUTION_NAME}}.Domain.Interfaces;

public interface IRepository<T> where T : class
{
    //Create
    Task CreateAsync(T entity);
    Task CreateRangeAsync(IEnumerable<T> entities);

    //Read
    Task<IEnumerable<T>> ReadAllAsync();
    Task<IEnumerable<T>> ReadAllWithNavigationsAsync();

    ValueTask<T> ReadByIdAsync(Guid id);

    ValueTask<T> ReadByIdWithNavigationsAsync(Guid id);

    Task<IEnumerable<T>> ReadByIdsAsync(IEnumerable<Guid> ids);

    Task<IEnumerable<T>> ReadByIdsWithNavigationsAsync(IEnumerable<Guid> ids);

    //Update
    void Update(T entity);
    void UpdateRange(IEnumerable<T> entities);

    //Delete
    void Remove(T entity);
    void RemoveRange(IEnumerable<T> entities);

    //Where
    Task<IEnumerable<T>> ReadWhereAsync(Expression<Func<T, bool>> predicate);
    Task<IEnumerable<T>> ReadWhereWithIncludeAsync(Expression<Func<T, bool>> predicate, params Expression<Func<T, object>>[] includeProperties);

    //Count
    ValueTask<int> CountAsync(Expression<Func<T, bool>> predicate);
    ValueTask<int> CountWithIncludeAsync(Expression<Func<T, bool>> predicate, params Expression<Func<T, object>>[] includeProperties);

    //Skip and Take
    Task<List<T>> ReadPagedAsync(Expression<Func<T, bool>> predicate, int pageNumber, int pageSize);
    Task<List<T>> ReadPagedWithIncludeAsync(Expression<Func<T, bool>> predicate, int pageNumber, int pageSize, params Expression<Func<T, object>>[] includeProperties);

    //First
    ValueTask<T> FirstOrDefaultAsync(Expression<Func<T, bool>> predicate);
    ValueTask<T> FirstOrDefaultWithIncludeAsync(Expression<Func<T, bool>> predicate, params Expression<Func<T, object>>[] includeProperties);

    //Exists
    ValueTask<bool> ExistsAsync(Guid id);
    ValueTask<bool> HasAnyAsync();
    ValueTask<bool> HasAnyAsync(Expression<Func<T, bool>> predicate);
    ValueTask<bool> HasAnyWithIncludeAsync(Expression<Func<T, bool>> predicate, params Expression<Func<T, object>>[] includeProperties);
}
