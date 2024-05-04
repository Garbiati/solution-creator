using AutoMapper;
using {{SOLUTION_NAME}}.Application.ViewModels.Example;
using {{SOLUTION_NAME}}.Domain.Entities;

namespace {{SOLUTION_NAME}}.Application.Mappings
{
    public class ExampleMappingProfile : Profile
{
    public ExampleMappingProfile()
    {
        CreateMap<ExampleViewModel, Example>();
        CreateMap<Example, ExampleViewModel>();
    }
}
}