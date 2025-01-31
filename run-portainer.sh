echo "Removing Portainer container (if it exists)..."
docker stop portainer
docker rm portainer

echo "Pulling latest Portainer image..."
docker pull portainer/portainer-ce:latest

echo "Running a Portainer container (Web UI for Docker)..."
docker volume create portainer_data
docker run -d -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce