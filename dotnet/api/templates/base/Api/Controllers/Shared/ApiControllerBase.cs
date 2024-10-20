using {{SOLUTION_NAME}}.Application.DTO.Example;
using {{SOLUTION_NAME}}.Application.Interfaces;
using {{SOLUTION_NAME}}.Domain.Entities;
using Microsoft.AspNetCore.JsonPatch;
using Microsoft.AspNetCore.Mvc;

namespace {{SOLUTION_NAME}}.Api.Controllers.Shared
{
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
        public async Task<ActionResult<IEnumerable<TDto>>> GetAll([FromQuery] bool detailed = false)
        {
            var items = await _service.GetAllAsync(detailed);
            return Ok(items);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<TDto>> GetById(Guid id, [FromQuery] bool detailed = false)
        {
            var item = await _service.GetByIdAsync(id, detailed);
            if (item == null)
                return NotFound();
            return Ok(item);
        }

        [HttpPost]
        public async Task<ActionResult<TDto>> Create([FromBody] TCreateDto createDto)
        {
            var item = await _service.CreateAsync(createDto);
            return CreatedAtAction(nameof(GetById), new { id = ((dynamic)item).Id }, item);
        }

        [HttpPut("{id}")]
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
        public async Task<IActionResult> Patch(Guid id, [FromBody] JsonPatchDocument<TUpdateDto> patchDoc)
        {
            try
            {
                await _service.PatchAsync(id, patchDoc);
                return NoContent();
            }
            catch (KeyNotFoundException)
            {
                return NotFound();
            }
        }

        [HttpDelete("{id}")]
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
}
