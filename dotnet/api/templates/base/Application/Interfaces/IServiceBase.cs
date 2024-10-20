using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Threading.Tasks;
using Microsoft.AspNetCore.JsonPatch;

namespace {{SOLUTION_NAME}}.Application.Interfaces
{
    public interface IServiceBase<TEntity, TDTO, TCreateDTO, TUpdateDTO>
        where TEntity : class
        where TDTO : class
        where TCreateDTO : class
        where TUpdateDTO : class
    {
        //Create
        Task<TDTO> CreateAsync(TCreateDTO createDto);

        Task CreateRangeAsync(IEnumerable<TCreateDTO> createDtos);

        //Read
        Task<IEnumerable<TDTO>> GetAllAsync(bool detailed = false);
        ValueTask<TDTO> GetByIdAsync(Guid id, bool detailed = false);
        Task<IEnumerable<TDTO>> GetByIdsAsync(IEnumerable<Guid> ids, bool detailed = false);

        //Update
        Task UpdateAsync(Guid id, TUpdateDTO updateDto);

        Task UpdateRangeAsync(IEnumerable<(Guid Id, TUpdateDTO UpdateDto)> updateDtos);
        Task PatchAsync(Guid id, JsonPatchDocument<TUpdateDTO> patchDoc);

        //Delete
        Task DeleteAsync(Guid id);

        Task DeleteRangeAsync(IEnumerable<Guid> ids);

        //Paging
        Task<(IEnumerable<TDTO> Items, int TotalCount, int TotalPages)> GetPagedAsync(
            Expression<Func<TEntity, bool>> predicate, int pageNumber, int pageSize);

        //Exists
        Task<bool> ExistsAsync(Guid id);
    }
}
