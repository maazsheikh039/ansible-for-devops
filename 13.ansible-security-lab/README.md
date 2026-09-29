# Ansible Security Hardening & Compliance (Lab 13)

This repository contains Ansible playbooks and reusable roles designed to automate SSH security hardening, firewall configuration (UFW), intrusion prevention (Fail2ban), and security compliance validation on Linux systems.

## 📌 Features & Configurations

- **SSH Hardening (`ssh-hardening.yml`):**
  - Disables SSH root login & password authentication.
  - Enforces SSH key-based authentication.
  - Sets max authentication attempts, timeout intervals, and restricts access to specific user groups (`ssh-users`).

- **Firewall Automation (`firewall-config.yml`):**
  - Configures UFW with default incoming deny & outgoing allow policies.
  - Opens essential ports (22/SSH, 80/HTTP, 443/HTTPS).
  - Explicitly blocks high-risk legacy ports (23, 135, 139, 445, 1433, 3389).

- **Advanced Security & Intrusion Prevention (`advanced-security.yml`):**
  - Deploys Fail2ban with SSH jail rules (ban time: 1 hour, max retries: 3).
  - Configures unattended automatic security updates.
  - Enforces strict permissions (`0600`) on sensitive files (`/etc/shadow`, `/etc/sshd_config`).

- **Compliance Check (`compliance-check.yml`):**
  - Runs dry-run (`check_mode`) checks to validate system compliance against security baselines.

- **Ansible Roles (`roles/security-hardening`):**
  - Modularized, reusable Ansible tasks and handlers for enterprise deployment.

---

## 🚀 How to Run

### 1. Prerequisites
Ensure Ansible and dependencies are installed:
```bash
sudo apt update
sudo apt install -y python3 python3-pip openssh-server ufw
pip3 install ansible --break-system-packages


ansible -i inventory.ini local -m ping

ansible-playbook -i inventory.ini master-security-playbook.yml

ansible-playbook -i inventory.ini compliance-check.yml
sudo ./generate-security-report.sh


.
├── inventory.ini                  # Local Ansible inventory
├── ssh-hardening.yml              # Standalone SSH hardening playbook
├── firewall-config.yml            # Standalone UFW firewall playbook
├── advanced-security.yml          # Fail2ban and auto-updates playbook
├── compliance-check.yml           # Security compliance check playbook
├── master-security-playbook.yml   # Master playbook importing roles
├── generate-security-report.sh    # Custom bash report generator
└── roles/
    └── security-hardening/        # Reusable Ansible Role
        ├── tasks/
        │   ├── main.yml
        │   ├── ssh-hardening.yml
        │   ├── firewall-config.yml
        │   └── system-security.yml
        └── handlers/
            └── main.yml
