#!/usr/bin/env python3

import requests
import json
import sys
from datetime import datetime

def check_service(url, name):
    try:
        response = requests.get(url, timeout=5)
        if response.status_code == 200:
            data = response.json()
            print(f"✓ {name}: {data.get('message', 'OK')} - {data.get('environment', 'unknown')}")
            return True
        else:
            print(f"✗ {name}: HTTP {response.status_code}")
            return False
    except Exception as e:
        print(f"✗ {name}: {str(e)}")
        return False

def main():
    print("=== Hybrid Cloud Deployment Status ===")
    print(f"Check time: {datetime.now().isoformat()}")
    print()
    
    services = [
        ("http://localhost:5000", "On-Premises Web Service"),
        ("http://localhost:5001", "Cloud Web Service"),
        ("http://localhost:8080", "Load Balancer"),
        ("http://localhost:9090", "Monitoring Service"),
        ("http://localhost:5000/health", "On-Prem Health Check"),
        ("http://localhost:5001/health", "Cloud Health Check")
    ]
    
    healthy_count = 0
    total_count = len(services)
    
    for url, name in services:
        if check_service(url, name):
            healthy_count += 1
    
    print()
    print(f"Overall Status: {healthy_count}/{total_count} services healthy")
    
    if healthy_count == total_count:
        print("🎉 All services are running successfully!")
        sys.exit(0)
    else:
        print("⚠️️  Some services are not responding properly")
        sys.exit(1)

if __name__ == "__main__":
    main()
