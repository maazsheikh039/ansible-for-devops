#!/bin/bash

echo "=== Hybrid Cloud Service Monitor ==="
echo "Timestamp: $(date)"
echo

echo "=== Container Status ==="
docker ps --format "table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}"
echo

echo "=== Network Information ==="
docker network ls
echo

echo "=== Service Health Checks ==="
services=("5000" "5001" "8080" "9090")
for port in "${services[@]}"; do
    if curl -s -f http://localhost:$port/health > /dev/null 2>&1 || curl -s -f http://localhost:$port > /dev/null 2>&1; then
        echo "✓ Service on port $port is healthy"
    else
        echo "✗ Service on port $port is not responding"
    fi
done
echo

echo "=== Resource Usage ==="
docker stats --no-stream --format "table {{.Container}}\t{{.CPUPerc}}\t{{.MemUsage}}"
