# Centralized Ansible Automation with AWX / Tower (Lab 17)

This repository contains sample playbooks managed via **AWX (Ansible Tower Open Source)** for centralized automation, job orchestration, inventory tracking, and system health reporting.

---

## 📌 Playbooks Included

- **`site.yml` (System Information Gathering):**
  - Collects system architecture, memory, and distribution facts.
  - Generates timestamped audit test files in `/tmp/`.
  - Captures server system time and logs output.

- **`disk-usage.yml` (Resource & Process Monitor):**
  - Executes `df -h` to report partition disk usage.
  - Inspects RAM usage via `free -h`.
  - Captures top active system processes.

- **`inventory.ini`:**
  - Localhost inventory file configured for local execution.

---

## 🚀 How AWX Orchestrates These Playbooks

1. **Project Sync:** AWX references this repository path directly to pull active playbooks.
2. **Inventory Management:** Host variables (`ansible_connection: local`, `ansible_python_interpreter: /usr/bin/python3`) are mapped within AWX Local Inventory.
3. **Job Templates:** High-level execution recipes configured to launch `site.yml` and `disk-usage.yml` on demand or via scheduled triggers.

---

## 📂 Repository Structure

```text
.
├── site.yml                 # System information & verification playbook
├── disk-usage.yml           # Storage and memory audit playbook
├── inventory.ini            # Standalone INI inventory reference
├── requirements.yml         # Requirements file
└── README.md                # Documentation

