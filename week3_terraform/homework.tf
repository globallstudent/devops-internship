resource "google_compute_network" "week3-network" {
  name                    = "week3-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "week3-subnetwork" {
  name          = "week3-subnetwork"
  ip_cidr_range = "10.0.0.0/24"
  region        = var.region
  network       = google_compute_network.week3-network.id
}

resource "google_compute_firewall" "week3-firewall" {
  name    = "week3-firewall"
  network = google_compute_network.week3-network.name

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
  direction     = "INGRESS"
}

resource "google_compute_address" "week3-1-address" {
  name   = "week3-1-address"
  region = var.region
}

resource "google_compute_instance" "week3-1" {
  name         = "week3-1"
  machine_type = "e2-small"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.week3-subnetwork.name
    access_config {
      nat_ip = google_compute_address.week3-1-address.address
    }
  }

  metadata = {
    ssh-keys = "asliddin-abdumannonov:${file("internship.pub")}"
  }

  tags = ["http-server", "https-server"]
}