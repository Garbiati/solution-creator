#!/bin/bash

# BASE
#export PATH_TEMPLATES_BASE_CONFIG_DOTNETTOOLS="$TEMPLATES_PATH/base/.config/dotnet-tools.json"
export PATH_TEMPLATES_BASE_VSCODE_LAUNCH="$TEMPLATES_PATH/base/.vscode/launch.json"
export PATH_TEMPLATES_BASE_VSCODE_TASKS="$TEMPLATES_PATH/base/.vscode/tasks.json"
export PATH_TEMPLATES_BASE_DOCKERCOMPOSE="$TEMPLATES_PATH/base/docker-compose.yml"

#validate_file "$PATH_TEMPLATES_BASE_CONFIG_DOTNETTOOLS"
validate_file "$PATH_TEMPLATES_BASE_VSCODE_LAUNCH"
validate_file "$PATH_TEMPLATES_BASE_VSCODE_TASKS"
validate_file "$PATH_TEMPLATES_BASE_DOCKERCOMPOSE"

# BASE -> API
export PATH_TEMPLATES_BASE_API_CONTROLLERS_SHARED_APICONTROLLERBASE="$TEMPLATES_PATH/base/Api/Controllers/Shared/ApiControllerBase.cs"
export PATH_TEMPLATES_BASE_API_CONTROLLERS_V1_EXAMPLECONTROLLER="$TEMPLATES_PATH/base/Api/Controllers/v1/ExampleController.cs"
export PATH_TEMPLATES_BASE_API_EXTENSIONS_APIVERSIONINGSETUP="$TEMPLATES_PATH/base/Api/Extensions/ApiVersioningSetup.cs"
export PATH_TEMPLATES_BASE_API_EXTENSIONS_SWAGGERSETUP="$TEMPLATES_PATH/base/Api/Extensions/SwaggerSetup.cs"
export PATH_TEMPLATES_BASE_API_PROPERTIES_LAUNCHSETTINGS="$TEMPLATES_PATH/base/Api/Properties/launchSettings.json"
export PATH_TEMPLATES_BASE_API_APPSETTINGSDEVELOPMENT="$TEMPLATES_PATH/base/Api/appsettings.Development.json"
export PATH_TEMPLATES_BASE_API_DOCKERFILE="$TEMPLATES_PATH/base/Api/Dockerfile"
export PATH_TEMPLATES_BASE_API_DOCKERFILELIVE="$TEMPLATES_PATH/base/Api/Dockerfile.live"
export PATH_TEMPLATES_BASE_API_PROGRAM="$TEMPLATES_PATH/base/Api/Program.cs"

validate_file "$PATH_TEMPLATES_BASE_API_CONTROLLERS_SHARED_APICONTROLLERBASE"
validate_file "$PATH_TEMPLATES_BASE_API_CONTROLLERS_V1_EXAMPLECONTROLLER"
validate_file "$PATH_TEMPLATES_BASE_API_EXTENSIONS_APIVERSIONINGSETUP"
validate_file "$PATH_TEMPLATES_BASE_API_EXTENSIONS_SWAGGERSETUP"
validate_file "$PATH_TEMPLATES_BASE_API_PROPERTIES_LAUNCHSETTINGS"
validate_file "$PATH_TEMPLATES_BASE_API_APPSETTINGSDEVELOPMENT"
validate_file "$PATH_TEMPLATES_BASE_API_DOCKERFILE"
validate_file "$PATH_TEMPLATES_BASE_API_DOCKERFILELIVE"

# BASE -> APPLICATION
export PATH_TEMPLATES_BASE_APPLICATION_INTERFACES_IEXAMPLESERVICE="$TEMPLATES_PATH/base/Application/Interfaces/IExampleService.cs"
export PATH_TEMPLATES_BASE_APPLICATION_MAPPINGS_EXAMPLEMAPPINGPROFILE="$TEMPLATES_PATH/base/Application/Mappings/ExampleMappingProfile.cs"
export PATH_TEMPLATES_BASE_APPLICATION_SERVICES_EXAMPLESERVICE="$TEMPLATES_PATH/base/Application/Services/ExampleService.cs"
export PATH_TEMPLATES_BASE_APPLICATION_VIEWMODELS_EXAMPLE_EXAMPLEVIEWMODEL="$TEMPLATES_PATH/base/Application/ViewModels/Example/ExampleViewModel.cs"
export PATH_TEMPLATES_BASE_APPLICATION_VIEWMODELS_PAGEDRESULT="$TEMPLATES_PATH/base/Application/ViewModels/PagedResult.cs"

validate_file "$PATH_TEMPLATES_BASE_APPLICATION_INTERFACES_IEXAMPLESERVICE"
validate_file "$PATH_TEMPLATES_BASE_APPLICATION_MAPPINGS_EXAMPLEMAPPINGPROFILE"
validate_file "$PATH_TEMPLATES_BASE_APPLICATION_SERVICES_EXAMPLESERVICE"
validate_file "$PATH_TEMPLATES_BASE_APPLICATION_VIEWMODELS_EXAMPLE_EXAMPLEVIEWMODEL"
validate_file "$PATH_TEMPLATES_BASE_APPLICATION_VIEWMODELS_PAGEDRESULT"

# BASE -> DOMAIN
export PATH_TEMPLATES_BASE_DOMAIN_COMMON_BASEENTITY="$TEMPLATES_PATH/base/Domain/Common/BaseEntity.cs"
export PATH_TEMPLATES_BASE_DOMAIN_ENTITIES_EXAMPLE="$TEMPLATES_PATH/base/Domain/Entities/Example.cs"
export PATH_TEMPLATES_BASE_DOMAIN_ENUMS_EXAMPLEENUM="$TEMPLATES_PATH/base/Domain/Enums/ExampleEnum.cs"
export PATH_TEMPLATES_BASE_DOMAIN_INTERFACES_IEXAMPLEREPOSITORY="$TEMPLATES_PATH/base/Domain/Interfaces/IExampleRepository.cs"
export PATH_TEMPLATES_BASE_DOMAIN_INTERFACES_IBASEREPOSITORY="$TEMPLATES_PATH/base/Domain/Interfaces/IBaseRepository.cs"
export PATH_TEMPLATES_BASE_DOMAIN_VALIDATIONS_DOMAINEXCEPTIONVALIDATION="$TEMPLATES_PATH/base/Domain/Validations/DomainExceptionValidation.cs"

validate_file "$PATH_TEMPLATES_BASE_DOMAIN_COMMON_BASEENTITY"
validate_file "$PATH_TEMPLATES_BASE_DOMAIN_ENTITIES_EXAMPLE"
validate_file "$PATH_TEMPLATES_BASE_DOMAIN_ENUMS_EXAMPLEENUM"
validate_file "$PATH_TEMPLATES_BASE_DOMAIN_INTERFACES_IEXAMPLEREPOSITORY"
validate_file "$PATH_TEMPLATES_BASE_DOMAIN_INTERFACES_IBASEREPOSITORY"
validate_file "$PATH_TEMPLATES_BASE_DOMAIN_VALIDATIONS_DOMAINEXCEPTIONVALIDATION"

# BASE -> INFRASTRUCTURE DATA
export PATH_TEMPLATES_BASE_INFRA_DATA_CONTEXT_APPLICATIONDBCONTEXT="$TEMPLATES_PATH/base/Infra.Data/Context/ApplicationDbContext.cs"
export PATH_TEMPLATES_BASE_INFRA_DATA_ENTITIESCONFIGURATIONS_EXAMPLECONFIGURATION="$TEMPLATES_PATH/base/Infra.Data/EntitiesConfiguration/ExampleConfiguration.cs"
export PATH_TEMPLATES_BASE_INFRA_DATA_HELPERS_DATA_SEEDDATA="$TEMPLATES_PATH/base/Infra.Data/Helpers/Data/SeedData.cs"
export PATH_TEMPLATES_BASE_INFRA_DATA_REPOSITORIES_EXAMPLEREPOSITORY="$TEMPLATES_PATH/base/Infra.Data/Repositories/ExampleRepository.cs"
export PATH_TEMPLATES_BASE_INFRA_DATA_REPOSITORIES_BASEREPOSITORY="$TEMPLATES_PATH/base/Infra.Data/Repositories/BaseRepository.cs"

validate_file "$PATH_TEMPLATES_BASE_INFRA_DATA_CONTEXT_APPLICATIONDBCONTEXT"
validate_file "$PATH_TEMPLATES_BASE_INFRA_DATA_ENTITIESCONFIGURATIONS_EXAMPLECONFIGURATION"
validate_file "$PATH_TEMPLATES_BASE_INFRA_DATA_HELPERS_DATA_SEEDDATA"
validate_file "$PATH_TEMPLATES_BASE_INFRA_DATA_REPOSITORIES_EXAMPLEREPOSITORY"
validate_file "$PATH_TEMPLATES_BASE_INFRA_DATA_REPOSITORIES_BASEREPOSITORY"

# BASE -> INFRASTRUCTURE IOC
export PATH_TEMPLATES_BASE_INFRA_IOC_NATIVEINJECTORCONFIG="$TEMPLATES_PATH/base/Infra.IoC/NativeInjectorConfig.cs"

validate_file "$PATH_TEMPLATES_BASE_INFRA_IOC_NATIVEINJECTORCONFIG"