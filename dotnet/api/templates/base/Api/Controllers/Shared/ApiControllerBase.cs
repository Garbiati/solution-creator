using {{SOLUTION_NAME}}.Application.DTO.Example;
using {{SOLUTION_NAME}}.Application.Interfaces;
using {{SOLUTION_NAME}}.Domain.Entities;
using Microsoft.AspNetCore.JsonPatch;
using Microsoft.AspNetCore.JsonPatch.Operations;
using Microsoft.AspNetCore.Mvc;
using Swashbuckle.AspNetCore.Annotations;
using Swashbuckle.AspNetCore.SwaggerGen;

namespace {{SOLUTION_NAME}}.Api.Controllers.Shared;

[ApiController]
[Route("api/{{SOLUTION_NAME}}/v{version:apiVersion}/[controller]")]
public class ApiControllerBase<TEntity, TDto, TCreateDto, TUpdateDto> : ControllerBase
    where TDto : class
    where TCreateDto : class
    where TUpdateDto : class
    where TEntity : class
{
    protected readonly IServiceBase<TEntity, TDto, TCreateDto, TUpdateDto> _service;

    public ApiControllerBase(IServiceBase<TEntity, TDto, TCreateDto, TUpdateDto> service)
    {
        _service = service;
    }

    [HttpGet]
    [SwaggerOperation(Summary = "Retrieves a list of all items.", Description = "Fetches all items with optional detailed information.")]
    [ProducesResponseType(StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<TDto>>> GetAll([FromQuery] bool detailed = false)
    {
        var items = await _service.GetAllAsync(detailed);
        return Ok(items);
    }

    [HttpGet("{id}")]
    [SwaggerOperation(Summary = "Retrieves an item by ID.", Description = "Fetches a single item based on its ID, with optional detailed information.")]
    [ProducesResponseType(StatusCodes.Status200OK)]
    [ProducesResponseType(StatusCodes.Status404NotFound)]
    public async Task<ActionResult<TDto>> GetById(Guid id, [FromQuery] bool detailed = false)
    {
        var item = await _service.GetByIdAsync(id, detailed);
        if (item == null)
            return NotFound();
        return Ok(item);
    }

    [HttpPost]
    [SwaggerOperation(Summary = "Creates a new item.", Description = "Creates a new item with the provided data.")]
    [ProducesResponseType(StatusCodes.Status201Created)]
    [ProducesResponseType(StatusCodes.Status400BadRequest)]
    public async Task<ActionResult<TDto>> Create([FromBody] TCreateDto createDto)
    {
        var item = await _service.CreateAsync(createDto);
        return CreatedAtAction(nameof(GetById), new { id = ((dynamic)item).Id }, item);
    }

    [HttpPut("{id}")]
    [SwaggerOperation(Summary = "Updates an existing item.", Description = "Updates an existing item with the provided data based on its ID.")]
    [ProducesResponseType(StatusCodes.Status204NoContent)]
    [ProducesResponseType(StatusCodes.Status404NotFound)]
    [ProducesResponseType(StatusCodes.Status400BadRequest)]
    public async Task<IActionResult> Update(Guid id, [FromBody] TUpdateDto updateDto)
    {
        try
        {
            await _service.UpdateAsync(id, updateDto);
            return NoContent();
        }
        catch (KeyNotFoundException)
        {
            return NotFound();
        }
    }

    [HttpPatch("{id}")]
    [SwaggerOperation(Summary = "Applies partial updates to an item.", Description = "Applies partial updates to an item based on a dictionary of changes.")]
    [ProducesResponseType(StatusCodes.Status204NoContent)]
    [ProducesResponseType(StatusCodes.Status404NotFound)]
    [ProducesResponseType(StatusCodes.Status400BadRequest)]
    [Consumes("application/json")]
    public async Task<IActionResult> Patch(Guid id, [FromBody] Dictionary<string, object> updates)
    {
        try
        {
            var patchDoc = new JsonPatchDocument<TUpdateDto>();

            foreach (var update in updates)
            {
                patchDoc.Operations.Add(new Operation<TUpdateDto>("replace", update.Key, null, update.Value));
            }

            await _service.PatchAsync(id, patchDoc);
            return NoContent();
        }
        catch (KeyNotFoundException)
        {
            return NotFound();
        }
    }

    [HttpDelete("{id}")]
    [SwaggerOperation(Summary = "Deletes an item.", Description = "Deletes an item based on its ID.")]
    [ProducesResponseType(StatusCodes.Status204NoContent)]
    [ProducesResponseType(StatusCodes.Status404NotFound)]
    public async Task<IActionResult> Delete(Guid id)
    {
        try
        {
            await _service.DeleteAsync(id);
            return NoContent();
        }
        catch (KeyNotFoundException)
        {
            return NotFound();
        }
    }
}

