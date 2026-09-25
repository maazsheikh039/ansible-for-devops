#!/usr/bin/env python3
import sys
import json
import requests

def fetch_inventory():
    url = "http://localhost:8080/instances"
    try:
        response = requests.get(url, timeout=5)
        response.raise_for_status()
        instances = response.json()
    except Exception as e:
        sys.stderr.write(f"Error fetching API: {e}\n")
        sys.exit(1)

    inventory = {
        "_meta": {
            "hostvars": {}
        }
    }

    for inst in instances:
        hostname = inst["hostname"]
        ip = inst["ip"]
        
        # Attach Hostvars
        inventory["_meta"]["hostvars"][hostname] = {
            "ansible_host": ip,
            "cloud_role": inst["role"],
            "cloud_env": inst["environment"],
            "cloud_team": inst["team"]
        }

        # Dynamic Tag Grouping
        for group_key in ["role", "environment", "team"]:
            group_name = inst[group_key]
            if group_name not in inventory:
                inventory[group_name] = {"hosts": [], "vars": {}}
            if hostname not in inventory[group_name]["hosts"]:
                inventory[group_name]["hosts"].append(hostname)

    return inventory

def main():
    if len(sys.argv) == 2 and sys.argv[1] == "--list":
        print(json.dumps(fetch_inventory(), indent=2))
    elif len(sys.argv) == 3 and sys.argv[1] == "--host":
        hostname = sys.argv[2]
        inv = fetch_inventory()
        hostvars = inv["_meta"]["hostvars"].get(hostname, {})
        print(json.dumps(hostvars, indent=2))
    else:
        print(json.dumps({"_meta": {"hostvars": {}}}))

if __name__ == '__main__':
    main()
