# GCP Terraform Infrastructure – Simulated Deployment

This project defines a basic infrastructure setup in Google Cloud Platform (GCP) using Terraform.

## 🔧 Resources Defined

- VPC network (`google_compute_network`)
- Subnetwork (`google_compute_subnetwork`)
- Compute Engine VM (`google_compute_instance`)
- Startup script to install Nginx

## 📁 Project Structure

gcp/
├── main.tf # Terraform configuration
├── variables.tf # Input variables
├── outputs.tf # Outputs for inspection
├── gcp-creds.json # (Credential placeholder)
└── README.md # Project documentation

## ⚙️ How to Use

> **Note:** This setup is currently a local simulation. No real resources will be deployed until valid GCP credentials are added.

1. Clone the repository
2. Navigate to the `gcp/` directory
3. Place your GCP credentials JSON as `gcp-creds.json`
4. Run:

```bash
terraform init
terraform plan
terraform apply

📦 Terraform Output Example

Apply complete! Resources: 3 added.
Outputs:

instance_ip = "34.120.12.34"
instance_name = "devops-vm"

📹 Demo
A short video walkthrough will be added soon to explain the code and Terraform behavior.

📚 Notes
Make sure to enable the Compute Engine API in your GCP project

This project is part of a multi-cloud DevOps portfolio
