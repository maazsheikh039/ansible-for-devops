This repository contains Ansible playbooks and configurations to automate Kubernetes cluster operations, resource deployments, scaling, rolling updates, and monitoring using Minikube and the `kubernetes.core` collection.

---

## 🛠 Project Structure

```text
ansible-k8s-lab/
├── ansible.cfg                  # Ansible configuration settings
├── inventory/
│   └── hosts                    # Inventory file for local execution
├── playbooks/
│   ├── manage-namespace.yml     # Creates and verifies k8s namespaces
│   ├── manage-deployment.yml    # Deploys Nginx container workloads
│   ├── manage-service.yml       # Exposes deployments via ClusterIP
│   ├── scale-deployment.yml     # Scales pod replicas up/down
│   ├── scale-down.yml           # Downscales deployment replicas
│   ├── full-app-lifecycle.yml   # Multi-action lifecycle manager
│   ├── monitor-resources.yml    # Checks deployment and pod status
│   └── cleanup.yml              # Teardown and resource deletion
└── README.md                    # Project documentation
