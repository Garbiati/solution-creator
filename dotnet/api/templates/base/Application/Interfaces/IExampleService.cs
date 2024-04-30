using {{PROJECT_NAME}}.Application.ViewModels;
using {{PROJECT_NAME}}.Application.ViewModels.Example;

namespace {{PROJECT_NAME}}.Application.Interfaces;
public interface IExampleService
{
    Task CreateExample(ExampleViewModel exampleViewModel);
    ValueTask<ExampleViewModel> GetExample(Guid id);
    ValueTask<List<ExampleViewModel>> GetAllExamples();
    Task UpdateExample(ExampleViewModel exampleViewModel);
    Task DeleteExample(Guid id);
    Task HardDeleteExample(Guid id);

    ValueTask<PagedResult<ExampleViewModel>> GetExamplesByName(string filterName, int pageNumber, int pageSize);
}