# Advanced Ansible Playbook Features (Lab 16)

This repository contains advanced Ansible playbooks demonstrating **loops**, **dict2items filters**, **fact-driven conditional logic**, and **Jinja2 templating**.

---

## 📌 Features & Implementations

### 1. Loop-Driven Resource Provisioning (`playbooks/loops.yml`)
- **Legacy Iteration:** Uses `with_items` to manage system user creation.
- **Modern Iteration:** Uses `loop` to generate directory structures.
- **Dictionary Transformation:** Utilizes the `dict2items` filter to iterate over service definitions and write custom configuration files (`config.txt`).

### 2. Fact-Driven Conditional Deployment (`playbooks/conditionals.yml`)
- **Host Fact Inspection:** Debugs OS details, available memory (`memtotal_mb`), and CPU core count (`processor_count`).
- **OS Branching:** Conditionally executes `apt` package management only when `ansible_facts['os_family'] == 'Debian'`.
- **Jinja2 Conditional Profiling:** Generates `/tmp/resource-profile.txt` with tier classifications (`Low`, `Medium`, `High`) using Jinja2 `if/elif/else` constructs.
- **Per-Item Conditional Loops:** Evaluates minimum memory requirements per application in a loop (`when: ansible_facts['memtotal_mb'] >= item.min_memory_mb`) to place deployment marker files in `/tmp/`.

---

## 🚀 How to Execute Playbooks

### 1. Verify Ansible Setup
```bash
cd ~/ansible-lab
ansible-inventory --list
ansible localhost -m ping

ansible-playbook playbooks/loops.yml

ansible-playbook playbooks/conditionals.yml


.
├── ansible.cfg              # Local Ansible configuration file
├── inventory/
│   └── hosts                # Localhost inventory definition
├── playbooks/
│   ├── loops.yml            # Loop constructs & dict2items playbook
│   └── conditionals.yml     # Fact-driven conditionals playbook
└── README.md                # Documentation

