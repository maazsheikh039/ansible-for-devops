# Automated Infrastructure Provisioning with Ansible & Nginx

## Objectives
- Configure an agentless configuration management engine using Ansible.
- Automate package management, dynamic Jinja2 web page templating, and service orchestration.
- Implement automated verification loops using HTTP status checks within Ansible playbooks.

## Tools Used
- **Automation Tool:** Ansible (Core)
- **Web Server:** Nginx
- **Templating Engine:** Jinja2
- **Language/Environment:** YAML, Python 3, Linux (Ubuntu/Debian)

## Key Skills Demonstrated
- Idempotent playbook development for CI/CD infrastructure pipelines.
- SSH Key-based authentication management.
- Automated service health verification and debugging.

## Troubleshooting & Optimization Log
- Fixed default SSH host key prompt delays by adding `host_key_checking = False` in `ansible.cfg`.
- Resolved privilege escalation issues during package management by implementing task-level `become: yes`.
