# Enterprise Ansible Cross-Distribution Package Management & Docker Automation

## Objectives
- Engineer cross-distribution package management playbooks utilizing `ansible_os_family` conditional branching.
- Deploy a containerized microservice infrastructure (Nginx, Redis, MySQL) using data-driven Ansible loops.
- Implement an automated infrastructure verification suite exporting structured JSON reports (`/tmp/lab-report.json`).
- Develop an idempotent environment teardown playbook.

## Tools & Requirements
- **Automation Framework:** Ansible Engine 2.14+
- **Container Infrastructure Engine:** Docker Engine & Python Docker SDK
- **Target OS:** Ubuntu 22.04 LTS

## Architectural Highlights
- **Data-Driven Container Loops:** Simplified container deployment maintenance by iterating over structured YAML variables.
- **Health Verification Quality Gates:** Automated multi-check assertions evaluating HTTP endpoints, socket connections, and database query status.
- **Automated JSON Audit Reports:** Generated JSON status reports using Jinja2/Ansible `to_nice_json` filters.

## Verification Run
Verify the infrastructure setup and run the audit engine:
```bash
ansible-playbook playbooks/deploy_containers.yml
ansible-playbook playbooks/validate_infrastructure.yml
python3 -m json.tool /tmp/lab-report.json
