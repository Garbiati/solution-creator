using {{SOLUTION_NAME}}.Application.DTO.Example;
using {{SOLUTION_NAME}}.Domain.Entities;
using {{SOLUTION_NAME}}.Application.Interfaces;
using {{SOLUTION_NAME}}.Domain.Interfaces;
using AutoMapper;

namespace {{SOLUTION_NAME}}.Application.Services;

public class ExampleService : ServiceBase<Example, ExampleDTO, ExampleCreateDTO, ExampleUpdateDTO>, IExampleService
{
    public ExampleService(IUnitOfWork unitOfWork, IMapper mapper) : base(unitOfWork, mapper)
    {
    }
}

