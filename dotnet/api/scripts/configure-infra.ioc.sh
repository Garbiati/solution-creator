#!/bin/bash

NEW_INFRA_IOC_NATIVEINJECTORCONFIG="$SOLUTION_NAME.Infra.IoC/NativeInjectorConfig.cs"
NEW_INFRA_IOC_DOTNETENVCONFIG="$SOLUTION_NAME.Infra.IoC/DotNetEnvConfig.cs"

sed "s/{{SOLUTION_NAME}}/$SOLUTION_NAME/g" "$PATH_TEMPLATES_BASE_INFRA_IOC_NATIVEINJECTORCONFIG" > "$NEW_INFRA_IOC_NATIVEINJECTORCONFIG"
sed "s/{{SOLUTION_NAME}}/$SOLUTION_NAME/g" "$PATH_TEMPLATES_BASE_INFRA_IOC_DOTNETENVCONFIG" > "$NEW_INFRA_IOC_DOTNETENVCONFIG"

validate_file "$NEW_INFRA_IOC_NATIVEINJECTORCONFIG"
validate_file "$NEW_INFRA_IOC_DOTNETENVCONFIG"

print_info "Created infrastructure IoC structures."