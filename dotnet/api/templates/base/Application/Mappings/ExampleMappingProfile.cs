using AutoMapper;
using {{PROJECT_NAME}}.Application.ViewModels.Example;
using {{PROJECT_NAME}}.Domain.Entities;

namespace {{PROJECT_NAME}}.Application.Mappings
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