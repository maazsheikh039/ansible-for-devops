#!/bin/bash

echo "=== Testing Cross-Platform Communication ==="
echo

# Test database connections inside running engine containers
echo "Testing database connectivity..."
docker exec $(docker ps -q --filter "name=onprem-database") pg_isready -U admin -d onprem_db
docker exec $(docker ps -q --filter "name=cloud-database") mysqladmin ping -h localhost -u clouduser -pcloudpass123

echo
echo "Testing service-to-service communication..."

# Test load balancer round-robin / routing distribution
echo "Load balancer distribution test:"
for i in {1..5}; do
    echo "Request $i:"
    curl -s http://localhost:8080/info | python3 -c "import sys, json; data=json.load(sys.stdin); print(f'  Environment: {data[\"environment\"]}, Instance: {data[\"instance_id\"]}')"
done

echo
echo "Direct service access test:"
echo "On-premises service:"
curl -s http://localhost:5000/info | python3 -m json.tool

echo
echo "Cloud service:"
curl -s http://localhost:5001/info | python3 -m json.tool
