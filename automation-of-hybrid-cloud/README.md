# Lab 19: Automation for Hybrid Cloud

This repository contains Ansible playbooks, Docker container configurations, and automation management scripts to simulate, deploy, and manage a complete multi-tier web service across both on-premises and cloud environment configurations.

---

## 🛠 Project Architecture & Structure

```text
hybrid-cloud-automation/
├── inventory/
│   └── hosts.yml               # Hybrid environment hosts (On-Premises & Cloud)
├── playbooks/
│   ├── site.yml                 # Master orchestrator playbook
│   ├── onprem-setup.yml        # On-premises infrastructure setup (PostgreSQL, Redis)
│   ├── cloud-setup.yml         # Cloud infrastructure setup (MySQL, Prometheus, Nginx)
│   └── deploy-webservice.yml   # Multi-tier web service deployment playbook
├── webservice/
│   ├── app.py                  # Python Flask web application
│   ├── Dockerfile              # Container image definition for web service
│   └── requirements.txt        # Application dependencies
├── scripts/
│   ├── monitor-services.sh     # Shell script for container and port status monitoring
│   ├── test-communication.sh  # Endpoint testing and load balancer verification
│   ├── deployment-status.py    # Python health-check script
│   └── cleanup-deployment.sh   # Environment teardown and volume cleanup
├── verify-lab.sh               # Complete lab verification script
└── README.md                   # Project documentation

🚀 Prerequisites
Ensure the following tools and packages are installed on your Linux machine:

Python 3.9+ & pip

Ansible & Python dependencies (docker-py, requests, pyyaml)

Docker Engine & docker-compose

cURL & net-tools

🏁 Step-by-Step Execution Guide
1. Environment Setup
Create and activate the Python virtual environment and install Ansible and Docker prerequisites:

python3 -m venv ~/hybrid-cloud-lab
source ~/hybrid-cloud-lab/bin/activate
pip install ansible docker-py requests pyyaml

cd ~/hybrid-cloud-automation/webservice
docker build -t hybrid-web-service:latest .

3. Deploy Complete Hybrid Infrastructure
Execute the master orchestration playbook to set up database engines, caching layer, monitoring, load balancer, and application containers across simulated environments:

cd ~/hybrid-cloud-automation
ansible-playbook -i inventory/hosts.yml playbooks/site.yml -v

🔍 Verification & Health Checks
Verify active containers, network routing, and health endpoints:

# Run complete verification script
./verify-lab.sh

# Monitor service health status
./scripts/monitor-services.sh
python3 scripts/deployment-status.py

# Test load balancer distribution & cross-platform connectivity
./scripts/test-communication.sh

🧹 Cleanup Instructions
To completely stop running containers, remove networks, and prune volumes:

./scripts/cleanup-deployment.sh

