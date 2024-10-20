using {{SOLUTION_NAME}}.Domain.Entities;
using {{SOLUTION_NAME}}.Domain.Interfaces;
using {{SOLUTION_NAME}}.Infra.Data.Context;
using System.Collections.Concurrent;
using {{SOLUTION_NAME}}.Infra.Data.Repositories;

namespace {{SOLUTION_NAME}}.Infra.Data.Repositories;
public class UnitOfWork : IUnitOfWork
{
    private readonly ApplicationDbContext _context;
    private ConcurrentDictionary<Type, object> _repositories;

    public UnitOfWork(ApplicationDbContext context)
    {
        _context = context;
        _repositories = new ConcurrentDictionary<Type, object>();
    }

    public IRepository<T> GetRepository<T>() where T : class
    {
        var type = typeof(T);
        if (_repositories.ContainsKey(type))
            return (IRepository<T>)_repositories[type];

        var repositoryInstance = new Repository<T>(_context);
        _repositories.TryAdd(type, repositoryInstance);
        return repositoryInstance;
    }

    // Properties for specific repositories
    public IRepository<Example> Examples
        => GetRepository<Example>();

    public IRepository<ExampleItem> ExampleItems
            => GetRepository<ExampleItem>();

    public async Task<int> CompleteAsync()
        => await _context.SaveChangesAsync();

    public void Dispose()
        => _context.Dispose();
}
