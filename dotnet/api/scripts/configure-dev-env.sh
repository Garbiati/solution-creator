#!/bin/bash

docker_compose_down
remove_docker_volume $SOLUTION_NAME
docker_compose_up

dotnet_tools_install
dotnet_ef_first_migration

echo "Configuração concluída com sucesso."