using {{SOLUTION_NAME}}.Application.DTO.Example;
using {{SOLUTION_NAME}}.Domain.Entities;
using {{SOLUTION_NAME}}.Application.Interfaces;
using {{SOLUTION_NAME}}.Domain.Interfaces;
using AutoMapper;

namespace {{SOLUTION_NAME}}.Application.Services;

public class ExampleItemService : ServiceBase<ExampleItem, ExampleItemDTO, ExampleItemCreateDTO, ExampleItemUpdateDTO>, IExampleItemService
{
    public ExampleItemService(IUnitOfWork unitOfWork, IMapper mapper) : base(unitOfWork, mapper)
    {
    }
}

