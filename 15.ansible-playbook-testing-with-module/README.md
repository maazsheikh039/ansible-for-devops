This repository demonstrates automated testing of Ansible roles using **Molecule** with **Docker** driver on Ubuntu containers. It covers containerized role deployment, systemd integration, and multi-assertion verification playbooks.

---

## 📌 Features & Configurations

- **Webserver Role (`tasks/main.yml`):**
  - Installs Apache web server (`apache2`).
  - Configures and enables systemd service management.
  - Deploys a custom `index.html` landing page.
  - Enforces port 80 binding configuration.

- **Molecule Test Framework (`molecule/default/`):**
  - **`molecule.yml`:** Configures Docker driver using `ubuntu:20.04` with systemd and cgroup support.
  - **`converge.yml`:** Executes and applies the `webserver` role against the test container.
  - **`verify.yml`:** Automated compliance & functionality assertions.

---

## 🧪 Molecule Verification Steps

The `verify.yml` playbook automatically asserts the following:
1. **Package Status:** Ensures `apache2` package is installed.
2. **Service State:** Verifies Apache is both `active` (running) and `enabled` at boot.
3. **Port Check:** Validates that port 80 is listening on `localhost`.
4. **File Integrity:** Verifies `/var/www/html/index.html` exists and contains correct content.
5. **HTTP Endpoint Check:** Performs an HTTP `GET` request using `ansible.builtin.uri` to confirm an HTTP `200 OK` response.

---

## 🚀 How to Run Tests

### 1. Activate Python Environment & Verify Tools
```bash
source ~/ansible-molecule-lab/molecule-env/bin/activate
molecule --version
ansible --version
docker --version

molecule test

molecule create     # Spawns test container
molecule converge   # Runs webserver role tasks
molecule verify     # Executes automated test assertions
molecule login      # Shell into test container for manual inspection
molecule destroy    # Cleans up container resources

.
├── handlers/
│   └── main.yml                  # Service restart/reload handlers
├── tasks/
│   └── main.yml                  # Webserver installation tasks
├── molecule/
│   └── default/
│       ├── molecule.yml          # Molecule & Docker platform setup
│       ├── converge.yml          # Playbook to apply webserver role
│       └── verify.yml            # Assertion tests for service & HTTP
├── test-report.md                # Generated test status output
└── README.md                     # Documentation
