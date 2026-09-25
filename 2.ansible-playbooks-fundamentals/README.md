# Ansible Automation & Infrastructure Provisioning Playbooks

## Objectives
- Master Ansible Playbook structure, YAML syntax, and idempotent execution patterns.
- Implement automated multi-package installation, custom user generation, and dynamic templating.
- Build fault-tolerant automation using error handling controls (`ignore_errors`, conditional execution, and status checks).
- Conduct pre-flight validation using syntax checks and dry-run modes.

## Tools Used
- **Configuration Management:** Ansible 2.15+
- **Languages/Formats:** YAML, Jinja2, Bash
- **Operating System:** Linux (Debian/Ubuntu)
- **Services:** Nginx, Systemd

## Key Skills Demonstrated
- Writing declarative Infrastructure-as-Code (IaC) playbooks.
- Implementing error resilience and conditional execution logic (`when`, `register`).
- Variable injection and dynamic facts manipulation (`ansible_date_time`).
- Idempotent configuration and service state control.

## Troubleshooting Log
- **Task Failure Bypass:** Resolved workflow breakage on non-existent package installations by utilizing `ignore_errors: yes` and register-based conditionals.
- **Service State Consistency:** Fixed Nginx execution skipping on idempotent runs by relaxing `when: nginx_install.changed` conditions.
