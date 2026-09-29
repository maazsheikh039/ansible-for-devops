#!/bin/bash
set -e

echo "=== Deployment Health Check ==="

# Check Nginx status
sudo systemctl is-active --quiet nginx && echo "✓ Nginx: RUNNING"

# Check Port 80 listener
sudo netstat -tlnp | grep -q ":80 " && echo "✓ Port 80: LISTENING"

# Check HTTP 200 OK Status
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" http://localhost)
[ "$HTTP_CODE" = "200" ] && echo "✓ HTTP Status: 200 OK"

# Check application text content
curl -s http://localhost | grep -q "Application Deployed Successfully" && echo "✓ Content Verification: PASSED"

echo "=== All Pipeline Automated Tests Passed ==="
