resource "google_compute_network" "week4-network" {
  name                    = "week4-network"
  auto_create_subnetworks = false
}


resource "google_compute_subnetwork" "week4-subnetwork" {
  name          = "week4-subnetwork"
  region        = "us-central1"
  network       = google_compute_network.week4-network.id
  ip_cidr_range = "10.0.0.0/24"
}


resource "google_compute_firewall" "week4-firewall" {
  name    = "week4-firewall"
  network = google_compute_network.week4-network.name

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
}


resource "google_compute_address" "week4-1-address" {
  name   = "week4-1-address"
  region = "us-central1"
}


resource "google_compute_instance" "week4-1" {
  name         = "week4-1"
  machine_type = "e2-small"
  zone         = "us-central1-a"
  project      = var.project_id

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.week4-subnetwork.name
    access_config {
      nat_ip = google_compute_address.week4-1-address.address
    }
  }

  metadata = {
    ssh-keys = "asliddin-abdumannonov:${file("./internship.pub")}"
  }

  service_account {
    email  = "task-service-internship@${var.project_id}.iam.gserviceaccount.com"
    scopes = ["cloud-platform"]
  }
}
