using {{SOLUTION_NAME}}.Api.Controllers.Shared;
using {{SOLUTION_NAME}}.Application.DTO.Example;
using {{SOLUTION_NAME}}.Application.Interfaces;
using {{SOLUTION_NAME}}.Domain.Entities;
using Microsoft.AspNetCore.Mvc;

namespace {{SOLUTION_NAME}}.Api.Controllers.v1
{
    [ApiVersion("1.0")]
    public class ExampleController : ApiControllerBase<Example, ExampleDTO, ExampleCreateDTO, ExampleUpdateDTO>
    {
        public ExampleController(IServiceBase<Example, ExampleDTO, ExampleCreateDTO, ExampleUpdateDTO> service) : base(service)
        {
        }
    }
}