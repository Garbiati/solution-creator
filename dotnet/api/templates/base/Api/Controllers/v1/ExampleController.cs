using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using {{SOLUTION_NAME}}.Api.Controllers.Shared;
using {{SOLUTION_NAME}}.Application.Interfaces;
using {{SOLUTION_NAME}}.Application.Services;
using {{SOLUTION_NAME}}.Application.ViewModels.Example;
using {{SOLUTION_NAME}}.Application.ViewModels;

namespace {{SOLUTION_NAME}}.Api.Controllers.v1
{
    [ApiVersion("1.0")]
    public class ExampleController : ApiControllerBase
    {
        private readonly IExampleService _exampleService;

        public ExampleController(IExampleService exampleService)
        {
            _exampleService = exampleService;
        }

        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult<IReadOnlyCollection<ExampleViewModel>>> Get()
        {
            var examples = await _exampleService.GetAllExamples();
            return Ok(examples);
        }

        [HttpGet("{id}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<ActionResult<ExampleViewModel>> Get(Guid id)
        {
            var example = await _exampleService.GetExample(id);
            if (example == null)
            {
                return NotFound();
            }
            return Ok(example);
        }



        [HttpPost]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult> Post([FromBody] ExampleViewModel exampleViewModel)
        {
            await _exampleService.CreateExample(exampleViewModel);
            return CreatedAtAction(nameof(Get), new { id = exampleViewModel.Id }, exampleViewModel);
        }

        [HttpPut("{id}")]
        [ProducesResponseType(StatusCodes.Status204NoContent)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<ActionResult> Put(Guid id, [FromBody] ExampleViewModel exampleViewModel)
        {
            var example = await _exampleService.GetExample(id);
            if (example == null)
            {
                return NotFound();
            }
            await _exampleService.UpdateExample(exampleViewModel);
            return NoContent();
        }

        [HttpDelete("{id}")]
        [ProducesResponseType(StatusCodes.Status204NoContent)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<ActionResult> Delete(Guid id)
        {
            var example = await _exampleService.GetExample(id);
            if (example == null)
            {
                return NotFound();
            }
            await _exampleService.DeleteExample(id);
            return NoContent();
        }

        [HttpDelete("hard-delete/{id}")]
        [ProducesResponseType(StatusCodes.Status204NoContent)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<ActionResult> HardDelete(Guid id)
        {
            var example = await _exampleService.GetExample(id);
            if (example == null)
            {
                return NotFound();
            }
            await _exampleService.HardDeleteExample(id);
            return NoContent();
        }

        [HttpGet("paged")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult<PagedResult<ExampleViewModel>>> GetPaged([FromQuery] string filterName, [FromQuery] int pageNumber, [FromQuery] int pageSize)
        {
            var examples = await _exampleService.GetExamplesByName(filterName, pageNumber, pageSize);
            return Ok(examples);
        }



    }
}
