#!/bin/bash

echo "=== Cleaning up Hybrid Cloud Deployment ==="

echo "Stopping and removing containers..."
docker stop $(docker ps -q) 2>/dev/null || true
docker rm $(docker ps -aq) 2>/dev/null || true

echo "Removing networks..."
docker network rm onprem-network cloud-network 2>/dev/null || true

echo "Removing volumes..."
docker volume prune -f

echo "Cleanup completed!"
