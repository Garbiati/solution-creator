using AutoMapper;
using {{SOLUTION_NAME}}.Application.DTO.Example;
using {{SOLUTION_NAME}}.Domain.Entities;

namespace {{SOLUTION_NAME}}.Application.Mappings
{
    public class ExampleItemMappingProfile : Profile
    {
        public ExampleItemMappingProfile()
        {
            CreateMap<ExampleItemDTO, ExampleItem>();
            CreateMap<ExampleItem, ExampleItemDTO>();

            CreateMap<ExampleItemCreateDTO, ExampleItem>();
            CreateMap<ExampleItem, ExampleItemCreateDTO>();

            CreateMap<ExampleItemUpdateDTO, ExampleItem>();
            CreateMap<ExampleItem, ExampleItemUpdateDTO>();
        }
    }
}