/* disabling as can't afford billing for this project

resource "google_project" "project01_webserver_prj" {
  name       = "project01-webserver-prj"
  project_id = "project01-webserver-prj-18200947911"
  folder_id  = 846003196741
  billing_account = "01DE66-1FC153-2D75CA"
}
resource "google_project_service" "project01_webserver_prj_compute" {
  project = google_project.project01_webserver_prj.id
  service = "compute.googleapis.com"
}
resource "google_project_service" "project01_webserver_prj_cloudresourcemanager" {
  project = google_project.project01_webserver_prj.id
  service = "cloudresourcemanager.googleapis.com"
}
*/

resource "google_compute_instance" "geuw3plapacap01" {
  name         = "geuw3plapacap01"
  zone         = "europe-west3-b"
  machine_type = "e2-medium"
  project = "host-prd-prj-18200947911"
  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
      labels = {
        my_label = "value"
      }
    }
  }
  network_interface {
    network = "vpc-euwe3-dmzprod"
    subnetwork = "vpc-euwe3-dmzprod-subnet"
    subnetwork_project = "host-prd-prj-18200947911"
  }
  metadata = {
    startup-script = <<-EOT
        #!/bin/bash
        sudo apt-get update
        sudo apt-get install apache2 -y
        sudo chmod 666 /var/www/html/index.html
        sudo echo "<h3>Web Server: www1</h3>"| tee /var/www/html/index.html
        sudo service apache2 restart
        EOT
  }
}

resource "google_compute_firewall" "allow_ssh_iap_https_http" {
  name    = "allow-ssh-iap-https-http"
  network = "vpc-euwe3-dmzprod"
  project = "host-prd-prj-18200947911"

  allow {
    protocol = "tcp"
    ports    = ["22", "443", "80"]
  }
  source_ranges = ["0.0.0.0/0", "35.235.240.0/20"]
}
