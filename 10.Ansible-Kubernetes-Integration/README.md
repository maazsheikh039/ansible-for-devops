# Kubernetes Orchestration & Automation using Ansible

## Objectives
- Deploy and manage a single-node Kubernetes cluster using Minikube and Docker.
- Integrate Ansible with Kubernetes using the `kubernetes.core` collection and Python `kubernetes` SDK.
- Automate declarative deployments of Namespaces, ConfigMaps, Pods, Services, and Deployments.
- Manage container lifecycles dynamically using Ansible conditionals and lifecycle tasks.

## Requirements
- **Container Runtime:** Docker Engine
- **Orchestrator:** Minikube / `kubectl`
- **Automation Engine:** Ansible inside dedicated Python 3 venv
- **Ansible Collection:** `kubernetes.core`
- **Python Client:** `kubernetes`

## Architectural Highlights
- **Declarative Resource Management:** Uses `kubernetes.core.k8s` with embedded definitions instead of raw `kubectl` shell commands.
- **Health Verification:** Implements native wait parameters (`wait_condition: type: Ready status: "True"`) to block playbook steps until workloads pass health checks.
- **Dynamic Action Routing:** Uses runtime variables (`-e "pod_action=..."`) to trigger specific operations within unified playbooks.

## Deployment Verification
Provision and test all resources end-to-end:
```bash
source ~/ansible-env/bin/activate
cd ~/ansible-k8s
ansible-playbook playbooks/create-namespace.yml
ansible-playbook playbooks/deploy-pod.yml
ansible-playbook playbooks/deploy-deployment.yml
kubectl get all -n ansible-demo
