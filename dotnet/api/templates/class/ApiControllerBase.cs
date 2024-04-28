using Microsoft.AspNetCore.Mvc;

namespace Reminder.Api.Controllers.Shared;

[ApiController]
[Route("api/reminder/v{version:apiVersion}/[controller]")]
public class ApiControllerBase : ControllerBase { }