using {{SOLUTION_NAME}}.Domain.Entities;

namespace {{SOLUTION_NAME}}.Domain.Interfaces;
public interface IUnitOfWork : IDisposable
{
    IRepository<T> GetRepository<T>() where T : class;

    IRepository<Example> Examples { get; }

    Task<int> CompleteAsync();
}