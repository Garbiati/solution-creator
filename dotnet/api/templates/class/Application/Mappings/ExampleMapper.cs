using AutoMapper;
using {{PROJECT_NAME}}.Application.ViewModels.Example;
using {{PROJECT_NAME}}.Domain.Entities;

namespace {{PROJECT_NAME}}.Application.Mappings
{
    public class ExampleMapper : Profile
    {
        public ExampleMapper()
        {
            CreateMap<ExampleViewModel, Example>();
            CreateMap<Example, ExampleViewModel>();
        }
    }
}