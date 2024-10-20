using {{SOLUTION_NAME}}.Api.Controllers.Shared;
using {{SOLUTION_NAME}}.Application.DTO.Example;
using {{SOLUTION_NAME}}.Application.Interfaces;
using {{SOLUTION_NAME}}.Domain.Entities;

namespace {{SOLUTION_NAME}}.Api.Controllers.v1;
public class ExampleItemsController : ApiControllerBase<ExampleItem, ExampleItemDTO, ExampleItemCreateDTO, ExampleItemUpdateDTO>
{
    public ExampleItemsController(IServiceBase<ExampleItem, ExampleItemDTO, ExampleItemCreateDTO, ExampleItemUpdateDTO> service) : base(service)
    {
    }
}
