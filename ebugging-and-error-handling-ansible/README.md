# Lab 14: Debugging and Error Handling in Ansible

This repository contains multi-layered Ansible playbooks demonstrating advanced error handling, debugging techniques, custom failure conditions, retry mechanisms, and structured deployment logging.

---

## 📌 Project Features

- **Debug Module Mastery (`debug-and-fail.yml`):**
  - Uses `debug` across 4 distinct styles: raw variables (`var`), formatted strings (`msg`), conditional execution (`when`), and verbosity restriction (`verbosity`).
  - Enforces precondition validations using the `fail` module for numeric thresholds, list membership, and boolean checks.

- **Custom Failure Conditions (`custom-failure-conditions.yml`):**
  - Overrides default change state using `changed_when: false`.
  - Implements custom error triggering using `failed_when` for threshold checks and multi-condition `or` expressions.

- **Resilient Deployment with Retries (`resilient-deployment.yml`):**
  - Implements a multi-stage deployment using `block/rescue/always` structures.
  - Features retry logic (`retries`, `delay`, `until`) for tasks interacting with unreliable resources.
  - Generates structured logs under `/tmp/deployment-logs/` with execution tracking in `run.log`.

- **Deployment Summary & Reporting (`error-report.yml`):**
  - Parses logs from `/tmp/deployment-logs/` and constructs a summary dictionary using `set_fact`.
  - Halts execution if failure markers (`FAILED`) are found and displays an execution status report.

---

## 📂 Repository Structure

```text
.
├── ansible.cfg                          # Custom Ansible configuration
├── inventory/
│   └── hosts                            # Local inventory file
├── logs/
│   └── ansible.log                      # Default Ansible log output
├── playbooks/
│   ├── debug-and-fail.yml               # Debugging & precondition checks
│   ├── custom-failure-conditions.yml    # State & failure condition overrides
│   ├── resilient-deployment.yml         # Block/rescue/always & retry deployment
│   └── error-report.yml                 # Log analysis & summary reporting
└── README.md                            # Project documentation


