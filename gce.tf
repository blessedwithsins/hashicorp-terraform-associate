resource "google_compute_instance" "testinst" {
  name         = "testinstance"
  //machine_type = "n2-standard-2"
  //machine_type = "e2-medium-2"
  machine_type = "e2-custom-8-40960"
  zone         = "us-east1-b"
  //min_cpu_platform = "Intel Broadwell"
  min_cpu_platform = "automatic" 
  project = ""
  allow_stopping_for_update = true 

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {
    foo = "bar"
  }

  metadata_startup_script = "echo hi > /test.txt"

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = ""
    scopes = ["cloud-platform"]
  }
}