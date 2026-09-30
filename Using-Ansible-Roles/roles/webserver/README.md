# Webserver Role Architecture

This Ansible role installs, configures, and validates Apache Web Server on Debian/Ubuntu systems.

## Requirements
- Ubuntu 20.04 / 22.04 LTS
- Ansible 2.14+
- Sudo privileges

## Role Variables
| Variable | Default Value | Description |
|----------|---------------|-------------|
| `webserver_package` | `apache2` | Web server package name |
| `webserver_port` | `80` | Bind port for VirtualHost |
| `site_title` | `Welcome to My Web Server` | Dynamic site landing header |

## Usage Example
```yaml
- hosts: webservers
  become: yes
  roles:
    - webserver

**Explanation:** Complete role technical documentation structure banayi gayi hai.

Tracked File: `roles/webserver/README.md`

---
