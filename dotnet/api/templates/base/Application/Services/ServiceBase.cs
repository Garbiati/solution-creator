
using System.Linq.Expressions;
using AutoMapper;
using {{SOLUTION_NAME}}.Application.Interfaces;
using {{SOLUTION_NAME}}.Domain.Interfaces;
using Microsoft.AspNetCore.JsonPatch;

namespace {{SOLUTION_NAME}}.Application.Services;
public class ServiceBase<TEntity, TDTO, TCreateDTO, TUpdateDTO> : IServiceBase<TEntity, TDTO, TCreateDTO, TUpdateDTO>
    where TEntity : class
    where TDTO : class
    where TCreateDTO : class
    where TUpdateDTO : class
{
    protected readonly IUnitOfWork _unitOfWork;
    protected readonly IMapper _mapper;

    public ServiceBase(IUnitOfWork unitOfWork, IMapper mapper)
    {
        _unitOfWork = unitOfWork;
        _mapper = mapper;
    }

    // Create
    public virtual async Task<TDTO> CreateAsync(TCreateDTO createDto)
    {
        var entity = _mapper.Map<TEntity>(createDto);
        await _unitOfWork.GetRepository<TEntity>().CreateAsync(entity);
        await _unitOfWork.CompleteAsync();
        return _mapper.Map<TDTO>(entity);
    }

    public virtual async Task CreateRangeAsync(IEnumerable<TCreateDTO> createDtos)
    {
        var entities = _mapper.Map<IEnumerable<TEntity>>(createDtos);
        await _unitOfWork.GetRepository<TEntity>().CreateRangeAsync(entities);
        await _unitOfWork.CompleteAsync();
    }

    // Read

    public virtual async Task<IEnumerable<TDTO>> GetAllAsync(bool detailed = false)
    {
        var entities = detailed
            ? await _unitOfWork.GetRepository<TEntity>().ReadAllWithNavigationsAsync()
            : await _unitOfWork.GetRepository<TEntity>().ReadAllAsync();

        return _mapper.Map<IEnumerable<TDTO>>(entities);
    }

    public virtual async ValueTask<TDTO> GetByIdAsync(Guid id, bool detailed = false)
    {
        var entity = detailed
            ? await _unitOfWork.GetRepository<TEntity>().ReadByIdWithNavigationsAsync(id)
            : await _unitOfWork.GetRepository<TEntity>().ReadByIdAsync(id);

        return _mapper.Map<TDTO>(entity);
    }

    public virtual async Task<IEnumerable<TDTO>> GetByIdsAsync(IEnumerable<Guid> ids, bool detailed = false)
    {
        var entities = detailed
            ? await _unitOfWork.GetRepository<TEntity>().ReadByIdsWithNavigationsAsync(ids)
            : await _unitOfWork.GetRepository<TEntity>().ReadByIdsAsync(ids);

        return _mapper.Map<IEnumerable<TDTO>>(entities);
    }

    // Update
    public virtual async Task UpdateAsync(Guid id, TUpdateDTO updateDto)
    {
        var existingEntity = await _unitOfWork.GetRepository<TEntity>().ReadByIdAsync(id);
        if (existingEntity == null)
        {
            throw new KeyNotFoundException("Entity not found");
        }

        _mapper.Map(updateDto, existingEntity);
        _unitOfWork.GetRepository<TEntity>().Update(existingEntity);
        await _unitOfWork.CompleteAsync();
    }
    public virtual async Task UpdateRangeAsync(IEnumerable<(Guid Id, TUpdateDTO UpdateDto)> updateDtos)
    {
        var ids = updateDtos.Select(ud => ud.Id).ToList();
        var existingEntities = await _unitOfWork.GetRepository<TEntity>().ReadByIdsAsync(ids);

        foreach (var existingEntity in existingEntities)
        {
            var entityId = (Guid)(typeof(TEntity).GetProperty("Id")?.GetValue(existingEntity) ?? Guid.Empty);

            var updateDto = updateDtos.First(ud => ud.Id == entityId);
            _mapper.Map(updateDto.UpdateDto, existingEntity);
        }

        _unitOfWork.GetRepository<TEntity>().UpdateRange(existingEntities);
        await _unitOfWork.CompleteAsync();
    }

    public virtual async Task PatchAsync(Guid id, JsonPatchDocument<TUpdateDTO> patchDoc)
    {
        var existingEntity = await _unitOfWork.GetRepository<TEntity>().ReadByIdAsync(id);
        if (existingEntity == null)
        {
            throw new KeyNotFoundException("Entity not found");
        }

        var updateDto = _mapper.Map<TUpdateDTO>(existingEntity);
        patchDoc.ApplyTo(updateDto);
        _mapper.Map(updateDto, existingEntity);

        _unitOfWork.GetRepository<TEntity>().Update(existingEntity);
        await _unitOfWork.CompleteAsync();
    }


    // Delete
    public virtual async Task DeleteAsync(Guid id)
    {
        var entity = await _unitOfWork.GetRepository<TEntity>().ReadByIdAsync(id);
        if (entity == null)
            throw new InvalidOperationException("Entity not found");

        _unitOfWork.GetRepository<TEntity>().Remove(entity);
        await _unitOfWork.CompleteAsync();
    }

    public async Task DeleteRangeAsync(IEnumerable<Guid> ids)
    {
        var entities = await Task
            .WhenAll(ids.Select(async id => await _unitOfWork.GetRepository<TEntity>()
            .ReadByIdAsync(id)));
        _unitOfWork.GetRepository<TEntity>().RemoveRange(entities);
        await _unitOfWork.CompleteAsync();
    }

    public virtual async Task<(IEnumerable<TDTO> Items, int TotalCount, int TotalPages)> GetPagedAsync(
        Expression<Func<TEntity, bool>> predicate, int pageNumber, int pageSize)
    {
        int totalCount = await _unitOfWork.GetRepository<TEntity>().CountAsync(predicate);
        int totalPages = (int)Math.Ceiling(totalCount / (double)pageSize);

        List<TEntity> pageData = await _unitOfWork.GetRepository<TEntity>().ReadPagedAsync(predicate, pageNumber, pageSize);
        IEnumerable<TDTO> mappedData = _mapper.Map<IEnumerable<TDTO>>(pageData);

        return (mappedData, totalCount, totalPages);
    }

    public async Task<bool> ExistsAsync(Guid id)
        => await _unitOfWork.GetRepository<TEntity>().ExistsAsync(id);


}
