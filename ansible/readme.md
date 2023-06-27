# Kubernetes Monitoring with Prometheus and Grafana

This repository contains an Ansible playbook that sets up Prometheus and Grafana on a Kubernetes cluster.

## Prerequisites

- Ansible 2.9 or later
- The `community.kubernetes` Ansible collection
- Helm v3 or later
- A configured Kubernetes cluster and a kubeconfig file

## Setup

1. **Clone the repository**

    ```sh
    git clone https://github.com/your-github-username/your-repo-name.git
    cd your-repo-name
    ```

2. **Install the necessary Ansible collections**

    The `community.kubernetes` collection is needed to use the `k8s` and `helm` modules. Install it with:

    ```sh
    ansible-galaxy collection install community.kubernetes
    ```

3. **Run the playbook**

    Replace `/path/to/kubeconfig` in the playbook with the path to your kubeconfig file, then run the playbook with:

    ```sh
    ansible-playbook playbook.yaml
    ```

## Components

The playbook sets up the following components:

- **Prometheus**: An open-source systems monitoring and alerting toolkit.
- **Grafana**: An open source metric analytics & visualization suite.

Both are deployed in the `monitoring` namespace and are exposed using a LoadBalancer service.

## Accessing Grafana and Prometheus

After running the playbook, you can retrieve the URLs for Grafana and Prometheus with:

```sh
kubectl get svc -n monitoring grafana -o jsonpath="{.status.loadBalancer.ingress[0].hostname}"
kubectl get svc -n monitoring prometheus-server -o jsonpath="{.status.loadBalancer.ingress[0].hostname}"

