using {{PROJECT_NAME}}.Domain.Common;
using System;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;

namespace {{PROJECT_NAME}}.Domain.Interfaces
{
    public interface IBaseRepository<T> where T : BaseEntity
    {
        Task CreateAsync(T entity);
        Task UpdateAsync(T entity);
        Task DeleteAsync(T entity);
        Task<T> GetAsync(Guid id);
        Task<List<T>> GetAllAsync();
    }
}
