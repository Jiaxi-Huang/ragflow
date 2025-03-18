#! /bin/bash
for container in ragflow-minio ragflow-es-01 ragflow-redis ragflow-server ragflow-mysql; do
    if docker ps -a --filter "name=$container" --format "{{.Names}}" | grep -q "^$container$"; then
        echo "Stopping $container..."
        docker stop "$container"
    else
        echo "Container $container does not exist or is already stopped."
    fi
done