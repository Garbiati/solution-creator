using Microsoft.AspNetCore.Mvc;

namespace {{SOLUTION_NAME}}.Api.Controllers.Shared;

[ApiController]
[Route("api/{{SOLUTION_NAME}}/v{version:apiVersion}/[controller]")]
public class ApiControllerBase : ControllerBase { }