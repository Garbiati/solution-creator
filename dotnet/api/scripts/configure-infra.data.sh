#!/bin/bash
#INFRASTRUCTURE DATA->CONTEXT
NEW_INFRA_DATA_CONTEXT_APPLICATIONDBCONTEXT="$SOLUTION_NAME.Infra.Data/Context/ApplicationDbContext.cs"
sed "s/{{SOLUTION_NAME}}/$SOLUTION_NAME/g" "$PATH_TEMPLATES_BASE_INFRA_DATA_CONTEXT_APPLICATIONDBCONTEXT" > "$NEW_INFRA_DATA_CONTEXT_APPLICATIONDBCONTEXT"
validate_file "$NEW_INFRA_DATA_CONTEXT_APPLICATIONDBCONTEXT"

#INFRASTRUCTURE DATA->ENTITIESCONFIGURATIONS
NEW_INFRA_DATA_ENTITIESCONFIGURATIONS_BASEENTITYCONFIGURATION="$SOLUTION_NAME.Infra.Data/EntitiesConfiguration/BaseEntityConfiguration.cs"
sed "s/{{SOLUTION_NAME}}/$SOLUTION_NAME/g" "$PATH_TEMPLATES_BASE_INFRA_DATA_ENTITIESCONFIGURATIONS_BASEENTITYCONFIGURATION" > "$NEW_INFRA_DATA_ENTITIESCONFIGURATIONS_BASEENTITYCONFIGURATION"
validate_file "$NEW_INFRA_DATA_ENTITIESCONFIGURATIONS_BASEENTITYCONFIGURATION"

NEW_INFRA_DATA_ENTITIESCONFIGURATIONS_EXAMPLECONFIGURATION="$SOLUTION_NAME.Infra.Data/EntitiesConfiguration/ExampleConfiguration.cs"
sed "s/{{SOLUTION_NAME}}/$SOLUTION_NAME/g" "$PATH_TEMPLATES_BASE_INFRA_DATA_ENTITIESCONFIGURATIONS_EXAMPLECONFIGURATION" > "$NEW_INFRA_DATA_ENTITIESCONFIGURATIONS_EXAMPLECONFIGURATION"
validate_file "$NEW_INFRA_DATA_ENTITIESCONFIGURATIONS_EXAMPLECONFIGURATION"

NEW_INFRA_DATA_ENTITIESCONFIGURATIONS_EXAMPLEITEMCONFIGURATION="$SOLUTION_NAME.Infra.Data/EntitiesConfiguration/ExampleItemConfiguration.cs"
sed "s/{{SOLUTION_NAME}}/$SOLUTION_NAME/g" "$PATH_TEMPLATES_BASE_INFRA_DATA_ENTITIESCONFIGURATIONS_EXAMPLEITEMCONFIGURATION" > "$NEW_INFRA_DATA_ENTITIESCONFIGURATIONS_EXAMPLEITEMCONFIGURATION"
validate_file "$NEW_INFRA_DATA_ENTITIESCONFIGURATIONS_EXAMPLEITEMCONFIGURATION"

#INFRASTRUCTURE DATA->EXTENSIONS
NEW_INFRA_DATA_EXTENSIONS_ENTITYFRAMEWORKEXTENSIONS="$SOLUTION_NAME.Infra.Data/Extensions/EntityFrameworkExtensions.cs"
sed "s/{{SOLUTION_NAME}}/$SOLUTION_NAME/g" "$PATH_TEMPLATES_BASE_INFRA_DATA_EXTENSIONS_ENTITYFRAMEWORKEXTENSIONS" > "$NEW_INFRA_DATA_EXTENSIONS_ENTITYFRAMEWORKEXTENSIONS"
validate_file "$NEW_INFRA_DATA_EXTENSIONS_ENTITYFRAMEWORKEXTENSIONS"

#INFRASTRUCTURE DATA->HELPERS
NEW_INFRA_DATA_HELPERS_DATA_SEEDDATA="$SOLUTION_NAME.Infra.Data/Helpers/Data/SeedData.cs"
sed "s/{{SOLUTION_NAME}}/$SOLUTION_NAME/g" "$PATH_TEMPLATES_BASE_INFRA_DATA_HELPERS_DATA_SEEDDATA" > "$NEW_INFRA_DATA_HELPERS_DATA_SEEDDATA"
validate_file "$NEW_INFRA_DATA_HELPERS_DATA_SEEDDATA"

#INFRASTRUCTURE DATA->REPOSITORIES
NEW_INFRA_DATA_REPOSITORIES_REPOSITORY="$SOLUTION_NAME.Infra.Data/Repositories/Repository.cs"
sed "s/{{SOLUTION_NAME}}/$SOLUTION_NAME/g" "$PATH_TEMPLATES_BASE_INFRA_DATA_REPOSITORIES_REPOSITORY" > "$NEW_INFRA_DATA_REPOSITORIES_REPOSITORY"
validate_file "$NEW_INFRA_DATA_REPOSITORIES_REPOSITORY"

NEW_INFRA_DATA_REPOSITORIES_UNITOFWORK="$SOLUTION_NAME.Infra.Data/Repositories/UnitOfWork.cs"
sed "s/{{SOLUTION_NAME}}/$SOLUTION_NAME/g" "$PATH_TEMPLATES_BASE_INFRA_DATA_REPOSITORIES_UNITOFWORK" > "$NEW_INFRA_DATA_REPOSITORIES_UNITOFWORK"
validate_file "$NEW_INFRA_DATA_REPOSITORIES_UNITOFWORK"

# BASE -> INFRASTRUCTURE IOC
NEW_INFRA_IOC_NATIVEINJECTORCONFIG="$SOLUTION_NAME.Infra.IoC/NativeInjectorConfig.cs"
sed "s/{{SOLUTION_NAME}}/$SOLUTION_NAME/g" "$PATH_TEMPLATES_BASE_INFRA_IOC_NATIVEINJECTORCONFIG" > "$NEW_INFRA_IOC_NATIVEINJECTORCONFIG"
validate_file "$NEW_INFRA_IOC_NATIVEINJECTORCONFIG"

print_info "Created infrastructure data structures."


# Change PrivateAssets to none in Microsoft.EntityFrameworkCore.Design
PATH_INFRA_DATA_CSPROJ="$SOLUTION_NAME.Infra.Data/$SOLUTION_NAME.Infra.Data.csproj"
sed -i '/Microsoft.EntityFrameworkCore.Design/,/PackageReference>/{
    /PrivateAssets/s/all/none/
}' $PATH_INFRA_DATA_CSPROJ
