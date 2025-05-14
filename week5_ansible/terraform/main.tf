resource "google_compute_network" "week5-network" {
  name                    = "week5-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "week5-subnetwork" {
  name          = "week5-subnetwork"
  ip_cidr_range = "10.0.0.0/24"
  region        = "us-central1"
  network       = google_compute_network.week5-network.id
}

resource "google_compute_firewall" "week5-firewall" {
  name    = "week5-firewall"
  network = google_compute_network.week5-network.id

  allow {
    protocol = "tcp"
    ports    = ["80", "443", "22"]
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_address" "week5-1-address" {
  name   = "week5-1-address"
  region = "us-central1"
}

resource "google_compute_instance" "week5-1" {
  name         = "week5-1"
  machine_type = "e2-small"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.week5-subnetwork.id
    access_config {
      nat_ip = google_compute_address.week5-1-address.address
    }
  }

  metadata = {
    ssh-keys = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPvqEOaVT518+3TPslvbPPbwWR7ZAAbfS8HjqwVRkBG2 asliddinabdumannonov06@gmail.com"
  }
}

resource "google_compute_address" "week5-2-address" {
  name   = "week5-2-address"
  region = "us-central1"
}

