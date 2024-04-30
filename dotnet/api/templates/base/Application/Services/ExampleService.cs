using System;
using AutoMapper;
using {{PROJECT_NAME}}.Application.Interfaces;
using {{PROJECT_NAME}}.Application.ViewModels;
using {{PROJECT_NAME}}.Application.ViewModels.Example;
using {{PROJECT_NAME}}.Domain.Entities;
using {{PROJECT_NAME}}.Domain.Interfaces;

namespace {{PROJECT_NAME}}.Application.Services;
public class ExampleService : IExampleService
{
    private readonly IMapper _mapper;
    private readonly IExampleRepository _exampleRepository;

    public ExampleService(IExampleRepository exampleRepository, IMapper mapper)
    {
        _exampleRepository = exampleRepository;
        _mapper = mapper;
    }

    public async ValueTask<PagedResult<ExampleViewModel>> GetExamplesByName(string filterName, int pageNumber, int pageSize)
    {
        if (string.IsNullOrWhiteSpace(filterName))
        {
            throw new ArgumentNullException(nameof(filterName));
        }

        if (pageNumber < 1)
        {
            throw new ArgumentOutOfRangeException(nameof(pageNumber));
        }

        if (pageSize < 1)
        {
            throw new ArgumentOutOfRangeException(nameof(pageSize));
        }
        var examples = _exampleRepository.GetByName(filterName, pageNumber, pageSize);

        var count = await _exampleRepository.CountByName(filterName);

        return new PagedResult<ExampleViewModel>
        {
            Items = _mapper.Map<List<ExampleViewModel>>(examples),
            TotalCount = count,
            TotalPages = (int)Math.Ceiling(count / (double)pageSize),
            CurrentPage = pageNumber,
            PageSize = pageSize
        };
    }

    public async Task CreateExample(ExampleViewModel exampleViewModel)
    {
        var exampleEntity = _mapper.Map<Example>(exampleViewModel);
        await _exampleRepository.CreateAsync(exampleEntity);
    }

    public async Task DeleteExample(Guid id)
    {
        var entity = await _exampleRepository.GetAsync(id);

        if (entity == null)
        {
            throw new Exception("Entity not found");
        }
        entity.Active = false;
        entity.DisabledAt = DateTimeOffset.Now;

        await _exampleRepository.UpdateAsync(entity);
    }

    public async Task HardDeleteExample(Guid id)
    {
        var entity = await _exampleRepository.GetAsync(id);

        if (entity == null)
        {
            throw new Exception("Entity not found");
        }

        await _exampleRepository.DeleteAsync(entity);
    }

    public async ValueTask<List<ExampleViewModel>> GetAllExamples()
    {
        return _mapper.Map<List<ExampleViewModel>>(await _exampleRepository.GetAllAsync());
    }

    public async ValueTask<ExampleViewModel> GetExample(Guid id)
    {
        return _mapper.Map<ExampleViewModel>(await _exampleRepository.GetAsync(id));
    }

    public Task UpdateExample(ExampleViewModel exampleViewModel)
    {
        _mapper.Map<Example>(exampleViewModel);
        return _exampleRepository.UpdateAsync(_mapper.Map<Example>(exampleViewModel));
    }
}
