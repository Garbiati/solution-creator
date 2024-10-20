using {{SOLUTION_NAME}}.Application.DTO.Example;
using {{SOLUTION_NAME}}.Application.Interfaces;
using {{SOLUTION_NAME}}.Domain.Entities;

public interface IExampleService : IServiceBase<Example, ExampleDTO, ExampleCreateDTO, ExampleUpdateDTO>
{

}