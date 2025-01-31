#!/bin/bash

# This script installs Docker on a Raspberry Pi and configures it to run containers on startup.

echo "Updating system packages..."
sudo apt update && sudo apt upgrade -y

echo "Installing Docker..."
sudo apt install docker.io -y

echo "Adding current user to the Docker group..."
# adding the user to docker group avoids the need to use sudo for Docker commands
sudo usermod -aG docker $USER
grep docker /etc/group
newgrp docker 

echo "Enabling Docker to start on boot..."
sudo systemctl enable docker
sudo systemctl start docker

echo "Verifying Docker installation..."
docker --version

echo "Running a test container (hello-world)..."
docker run --name=hello-world hello-world
docker rm hello-world
docker rmi hello-world

echo "Docker setup and installation is complete..."