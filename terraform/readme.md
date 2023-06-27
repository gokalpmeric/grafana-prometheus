# Kubernetes Monitoring with Prometheus and Grafana using Terraform

This repository contains a Terraform script that deploys Prometheus and Grafana to a Kubernetes cluster.

## Prerequisites

- Terraform v0.15.0 or later
- A configured Kubernetes cluster
- Helm v3 or later
- kubectl installed on your local machine

## Setup

1. **Clone the repository**

    ```sh
    git clone https://github.com/your-github-username/your-repo-name.git
    cd your-repo-name
    ```

2. **Initialize Terraform**

    Run the following command to download the necessary Terraform providers.

    ```sh
    terraform init
    ```

3. **Create a plan**

    Modify the variables in the Terraform scripts as needed, then run the following command to create a Terraform plan.

    ```sh
    terraform plan -out=tfplan
    ```

4. **Apply the plan**

    Run the following command to deploy the resources.

    ```sh
    terraform apply "tfplan"
    ```

## Components

The Terraform script will set up the following components in the `monitoring` namespace:

- **Prometheus**: An open-source systems monitoring and alerting toolkit.
- **Grafana**: An open source metric analytics & visualization suite.

Both Prometheus and Grafana are exposed using a LoadBalancer service.

## Accessing Grafana and Prometheus

After running the playbook, you can retrieve the URLs for Grafana and Prometheus with:

```sh
kubectl get svc -n monitoring grafana -o jsonpath="{.status.loadBalancer.ingress[0].hostname}"
kubectl get svc -n monitoring prometheus-server -o jsonpath="{.status.loadBalancer.ingress[0].hostname}"

