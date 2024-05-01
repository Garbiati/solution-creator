#!/bin/bash

validate_file "$PATH_TEMPLATES_BASE_INFRA_IOC_CONFIGUREIOC"

NEW_INFRA_IOC_CONFIGUREIOC="$PROJECT_NAME.Infra.IoC/ConfigureIoC.cs"

sed "s/{{PROJECT_NAME}}/$PROJECT_NAME/g" "$PATH_TEMPLATES_BASE_INFRA_IOC_CONFIGUREIOC" > "$NEW_INFRA_IOC_CONFIGUREIOC"

validate_file "$NEW_INFRA_IOC_CONFIGUREIOC"

print_info "Created infrastructure IoC structures."