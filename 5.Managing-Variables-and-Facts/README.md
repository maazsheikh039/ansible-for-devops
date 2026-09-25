# Enterprise Ansible Variable Precedence & Custom Fact Engine Architecture

## Objectives
- Design and validate Ansible variable precedence hierarchy (`group_vars`, `host_vars`, `vars`, `extra-vars`).
- Implement dynamic dictionary deep merging using external specification files (`-e @file`).
- Engineer executable local custom JSON fact engines (`/etc/ansible/facts.d/`).
- Build portable fact-driven conditional playbooks (`when`, `blocks`, dynamic loop filters) without hardcoded values.

## Tools Used
- **Automation Framework:** Ansible Engine 2.14+
- **Data Formats:** YAML, Jinja2, Executable JSON Shell Scripts
- **Target OS:** Ubuntu 22.04 LTS (AWS EC2 / Cloud Bare Metal)

## Key Architectural Patterns
- **Precedence Hierarchy Verification:** Proved runtime variable resolution order where `extra-vars` (`-e`) > `host_vars` > `group_vars`.
- **Targeted Fact Gathering:** Optimized fact collection performance by utilizing explicit `setup` module filters.
- **System-Adaptive Automation:** Implemented memory and disk space capacity check loops driven dynamically by live target machine metadata.

## Troubleshooting Log
- **Undefined Custom Fact Failures:** Resolved `ansible_local` scope resolution bugs by enforcing executable permissions (`chmod +x`) on custom JSON fact script generators.
