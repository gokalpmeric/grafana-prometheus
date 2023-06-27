# Grafana and Prometheus Deployment

This repository contains infrastructure as code (IaC) scripts to deploy Grafana and Prometheus on a Kubernetes cluster. Both Terraform and Ansible versions of the scripts are provided.

## Repository Structure

- `ansible`: Contains Ansible playbook for the deployment.
- `terraform`: Contains Terraform scripts for the deployment.

## Prerequisites

- A configured Kubernetes cluster
- Helm v3 or later
- Terraform v0.15.0 or later
- Ansible v2.9 or later
- kubectl installed on your local machine

## Usage

### Terraform

Navigate to the `terraform` directory and follow the instructions in the README.md file located there.

### Ansible

Navigate to the `ansible` directory and follow the instructions in the README.md file located there.

## Components

The scripts will set up the following components in the `monitoring` namespace:

- **Prometheus**: An open-source systems monitoring and alerting toolkit.
- **Grafana**: An open-source metric analytics & visualization suite.

Both Prometheus and Grafana are exposed using a LoadBalancer service.

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

[MIT](https://choosealicense.com/licenses/mit/)

