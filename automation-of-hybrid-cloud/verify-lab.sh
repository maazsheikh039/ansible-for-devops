#!/bin/bash

echo "=== Lab 19 Verification ==="
echo

# Check required containers
required_containers=("onprem-database" "onprem-cache" "cloud-database" "cloud-monitoring" "cloud-loadbalancer")
running_containers=$(docker ps --format "{{.Names}}")

echo "Checking required containers..."
for container in "${required_containers[@]}"; do
    if echo "$running_containers" | grep -q "$container"; then
        echo "✓ $container is running"
    else
        echo "✗ $container is not running"
    fi
done

# Check web service responses
echo
echo "Checking web services..."
if curl -s -f http://localhost:5000 > /dev/null; then
    echo "✓ On-premises web service is responding"
else
    echo "✗ On-premises web service is not responding"
fi

if curl -s -f http://localhost:5001 > /dev/null; then
    echo "✓ Cloud web service is responding"
else
    echo "✗ Cloud web service is not responding"
fi

if curl -s -f http://localhost:8080 > /dev/null; then
    echo "✓ Load balancer is responding"
else
    echo "✗ Load balancer is not responding"
fi

# Check Ansible Playbook presence
echo
echo "Checking Ansible playbooks..."
playbooks=("onprem-setup.yml" "cloud-setup.yml" "deploy-webservice.yml" "site.yml")
for playbook in "${playbooks[@]}"; do
    if [ -f "playbooks/$playbook" ]; then
        echo "✓ $playbook exists"
    else
        echo "✗ $playbook is missing"
    fi
done

echo
echo "=== Lab Verification Complete ==="
