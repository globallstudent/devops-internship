resource "google_compute_router" "week3-2-router" {
  name    = "week3-2-router"
  network = google_compute_network.week3-network.name
  region  = "us-central1"
}

resource "google_compute_address" "week3-2-address" {
  name   = "week3-2-address"
  region = "us-central1"
}

resource "google_compute_router_nat" "week3-nat" {
  name                               = "week3-nat"
  router                             = google_compute_router.week3-2-router.name
  region                             = "us-central1"
  nat_ip_allocate_option             = "MANUAL_ONLY"
  nat_ips                            = [google_compute_address.week3-2-address.self_link]
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}

resource "google_compute_instance" "week3-2" {
  name         = "week3-2"
  machine_type = "e2-small"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }

  metadata = {
    enable-oslogin = "TRUE"
  }

  network_interface {
    subnetwork = google_compute_subnetwork.week3-subnetwork.name
    access_config {}
  }

  tags = ["no-public-ip"]
}


# Extra: Task 5 - Create IAP SSH permissions for your instance named tunnel-accessor.
resource "google_project_iam_member" "tunnel-accessor" {
  project = "asliddin-abdumannonov"
  role    = "roles/iap.tunnelResourceAccessor"
  member  = "serviceAccount:task-service-internship@asliddin-abdumannonov.iam.gserviceaccount.com"
}