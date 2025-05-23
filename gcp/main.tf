provider "google" {
  credentials = file("${path.module}/gcp-creds.json")
  project     = jsondecode(file("${path.module}/gcp-creds.json")).project_id
  region      = var.region
  zone        = var.zone
}


resource "google_compute_network" "vpc_network" {
  name = "devops-vpc"
}

resource "google_compute_subnetwork" "subnet" {
  name          = "devops-subnet"
  ip_cidr_range = "10.0.0.0/24"
  region        = var.region
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_instance" "vm_instance" {
  name         = "devops-vm"
  machine_type = "e2-micro"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network    = google_compute_network.vpc_network.id
    subnetwork = google_compute_subnetwork.subnet.id
    access_config {} # public IP
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    sudo apt update
    sudo apt install -y nginx
  EOT
}
