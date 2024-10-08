#!/bin/bash

# Function to install Docker
install_docker() {
    echo "Instalando Docker..."
    sudo apt-get update
    sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    sudo apt-get update
    sudo apt-get install -y docker-ce
    sudo systemctl start docker
    sudo systemctl enable docker
    echo "Docker instalado com sucesso."
}

# Function to install Docker Compose
install_docker_compose() {
    echo "Instalando Docker Compose..."
    sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    echo "Docker Compose instalado com sucesso."
}

# Function to docker-compose up
docker_compose_up() {
    docker compose up -d --build
    echo "Docker compose up executado com sucesso."
}

# Function to docker-compose down
docker_compose_down() {
    docker compose down
}

remove_docker_volume() {
    local project_name=$1
    local project_name_lower=$(echo "$project_name" | tr '[:upper:]' '[:lower:]')
    local volume_name="${project_name_lower}_pgdata_${project_name}"

    echo "Attempting to remove Docker volume: $volume_name"
    docker volume rm "$volume_name"
    if [ $? -eq 0 ]; then
        echo "Volume $volume_name removed successfully."
    else
        echo "Failed to remove volume $volume_name. It may not exist or is currently in use."
    fi
}