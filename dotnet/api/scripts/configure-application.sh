#!/bin/bash

# BASE -> APPLICATION
validate_file "$PATH_TEMPLATES_BASE_APPLICATION_INTERFACES_IEXAMPLESERVICE"
validate_file "$PATH_TEMPLATES_BASE_APPLICATION_MAPPINGS_EXAMPLEMAPPINGPROFILE"
validate_file "$PATH_TEMPLATES_BASE_APPLICATION_SERVICES_EXAMPLESERVICE"
validate_file "$PATH_TEMPLATES_BASE_APPLICATION_VIEWMODELS_EXAMPLE_EXAMPLEVIEWMODEL"
validate_file "$PATH_TEMPLATES_BASE_APPLICATION_VIEWMODELS_PAGEDRESULT"

NEW_APPLICATION_INTERFACES_IEXAMPLESERVICE="$PROJECT_NAME.Application/Interfaces/IExampleService.cs"
NEW_APPLICATION_MAPPINGS_EXAMPLEMAPPINGPROFILE="$PROJECT_NAME.Application/Mappings/ExampleMappingProfile.cs"
NEW_APPLICATION_SERVICES_EXAMPLESERVICE="$PROJECT_NAME.Application/Services/ExampleService.cs"
NEW_APPLICATION_VIEWMODELS_EXAMPLE_EXAMPLEVIEWMODEL="$PROJECT_NAME.Application/ViewModels/Example/ExampleViewModel.cs"
NEW_APPLICATION_VIEWMODELS_PAGEDRESULT="$PROJECT_NAME.Application/ViewModels/PagedResult.cs"

sed "s/{{PROJECT_NAME}}/$PROJECT_NAME/g" "$PATH_TEMPLATES_BASE_APPLICATION_INTERFACES_IEXAMPLESERVICE" > "$NEW_APPLICATION_INTERFACES_IEXAMPLESERVICE"
sed "s/{{PROJECT_NAME}}/$PROJECT_NAME/g" "$PATH_TEMPLATES_BASE_APPLICATION_MAPPINGS_EXAMPLEMAPPINGPROFILE" > "$NEW_APPLICATION_MAPPINGS_EXAMPLEMAPPINGPROFILE"
sed "s/{{PROJECT_NAME}}/$PROJECT_NAME/g" "$PATH_TEMPLATES_BASE_APPLICATION_SERVICES_EXAMPLESERVICE" > "$NEW_APPLICATION_SERVICES_EXAMPLESERVICE"
sed "s/{{PROJECT_NAME}}/$PROJECT_NAME/g" "$PATH_TEMPLATES_BASE_APPLICATION_VIEWMODELS_EXAMPLE_EXAMPLEVIEWMODEL" > "$NEW_APPLICATION_VIEWMODELS_EXAMPLE_EXAMPLEVIEWMODEL"
sed "s/{{PROJECT_NAME}}/$PROJECT_NAME/g" "$PATH_TEMPLATES_BASE_APPLICATION_VIEWMODELS_PAGEDRESULT" > "$NEW_APPLICATION_VIEWMODELS_PAGEDRESULT"

validate_file "$NEW_APPLICATION_INTERFACES_IEXAMPLESERVICE"
validate_file "$NEW_APPLICATION_MAPPINGS_EXAMPLEMAPPINGPROFILE"
validate_file "$NEW_APPLICATION_SERVICES_EXAMPLESERVICE"
validate_file "$NEW_APPLICATION_VIEWMODELS_EXAMPLE_EXAMPLEVIEWMODEL"
validate_file "$NEW_APPLICATION_VIEWMODELS_PAGEDRESULT"

print_info "Created application structures."
