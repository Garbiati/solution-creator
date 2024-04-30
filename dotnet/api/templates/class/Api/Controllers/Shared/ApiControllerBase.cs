using Microsoft.AspNetCore.Mvc;

namespace {{PROJECT_NAME}}.Api.Controllers.Shared;

[ApiController]
[Route("api/{{PROJECT_NAME}}/v{version:apiVersion}/[controller]")]
public class ApiControllerBase : ControllerBase { }