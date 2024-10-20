using {{SOLUTION_NAME}}.Application.DTO.Example;
using {{SOLUTION_NAME}}.Application.Interfaces;
using {{SOLUTION_NAME}}.Domain.Entities;

public interface IExampleItemService : IServiceBase<ExampleItem, ExampleItemDTO, ExampleItemCreateDTO, ExampleItemUpdateDTO>
{

}