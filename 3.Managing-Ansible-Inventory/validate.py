import sys
import subprocess
import json

def validate_inventory(path):
    try:
        cmd = ["ansible-inventory", "-i", path, "--list"]
        result = subprocess.run(cmd, capture_output=True, text=True, check=True)
        data = json.loads(result.stdout)
        
        groups_count = len([g for g in data.keys() if g != "_meta"])
        
        hosts = set()
        for group, contents in data.items():
            if group == "_meta":
                continue
            if isinstance(contents, dict) and "hosts" in contents:
                hosts.update(contents["hosts"])
                
        hosts_count = len(hosts)
        
        if groups_count > 0 and hosts_count > 0:
            print(f"PASS {path}: {groups_count} groups, {hosts_count} hosts")
            return True
        else:
            print(f"FAIL {path}: Empty groups or hosts count")
            return False
            
    except Exception as e:
        print(f"FAIL {path}: {str(e)}")
        return False

def main():
    if len(sys.argv) < 2:
        print("Usage: python3 validate.py <inventory_path_1> [inventory_path_2 ...]")
        sys.exit(1)
        
    all_passed = True
    for path in sys.argv[1:]:
        if not validate_inventory(path):
            all_passed = False
            
    if all_passed:
        sys.exit(0)
    else:
        sys.exit(1)

if __name__ == '__main__':
    main()
