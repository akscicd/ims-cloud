# Hub VPC and subnet
resource "google_compute_network" "vpc_euwe3_p_hub01" {
  name    = "vpc-euwe3-p-hub01"
  project = google_project.host_hub_prj.project_id
  auto_create_subnetworks = false
}
resource "google_compute_subnetwork" "vpc_euwe3_p_hub01-subnet" {
    name = "vpc_euwe3_p_hub01-subnet"
    ip_cidr_range = "10.1.0.0/20"
    network = google_compute_network.vpc_euwe3_p_hub01
    region = "europe-west3"
}


resource "google_compute_network" "vpc_euwe3_p_hub02" {
  name    = "vpc-euwe3-p-hub02"
  project = google_project.host_hub_prj.project_id
  auto_create_subnetworks = false
}
resource "google_compute_subnetwork" "vpc_euwe3_p_hub02-subnet" {
    name = "vpc_euwe3_p_hub02-subnet"
    ip_cidr_range = "10.1.16.0/20"
    network = google_compute_network.vpc_euwe3_p_hub02
    region = "europe-west3"
}





# Prod Regional VPC and subnet

resource "google_compute_network" "vpc_euwe3_prod" {
  name    = "vpc-euwe3-prod"
  project = google_project.host_prd_prj.project_id
}
resource "google_compute_subnetwork" "vpc_euwe3_prod-subnet" {
    name = "vpc_euwe3_prod-subnet"
    ip_cidr_range = "10.2.0.0/20"
    network = google_compute_network.vpc_euwe3_prod
    region = "europe-west3"
}


resource "google_compute_network" "vpc_euwe3_dmzprod" {
  name    = "vpc-euwe3-dmzprod"
  project = google_project.host_prd_prj.project_id
}
resource "google_compute_subnetwork" "vpc_euwe3_dmzprod-subnet" {
    name = "vpc_euwe3_dmzprod-subnet"
    ip_cidr_range = "10.2.16.0/20"
    network = google_compute_network.vpc_euwe3_dmzprod
    region = "europe-west3"
}


# Nonprod Regional VPC and subnets

resource "google_compute_network" "vpc_euwe3_nonprod" {
  name    = "vpc-euwe3-nonprod"
  project = google_project.host_nonprd_prj.project_id
}
resource "google_compute_subnetwork" "vpc_euwe3_nonprod-subnet-dev" {
    name = "vpc_euwe3_nonprod-subnet-dev"
    ip_cidr_range = "10.3.0.0/22"
    network = google_compute_network.vpc_euwe3_nonprod
    region = "europe-west3"
}
resource "google_compute_subnetwork" "vpc_euwe3_nonprod-subnet-qa" {
    name = "vpc_euwe3_nonprod-subnet-qa"
    ip_cidr_range = "10.3.4.0/22"
    network = google_compute_network.vpc_euwe3_nonprod
    region = "europe-west3"
}
resource "google_compute_subnetwork" "vpc_euwe3_nonprod-subnet-uat" {
    name = "vpc_euwe3_nonprod-subnet-uat"
    ip_cidr_range = "10.3.8.0/22"
    network = google_compute_network.vpc_euwe3_nonprod
    region = "europe-west3"
}
resource "google_compute_subnetwork" "vpc_euwe3_nonprod-subnet-shared-services" {
    name = "vpc_euwe3_nonprod-subnet-shared-services"
    ip_cidr_range = "10.3.12.0/22"
    network = google_compute_network.vpc_euwe3_nonprod
    region = "europe-west3"
}



resource "google_compute_network" "vpc_euwe3_dmznonprod" {
  name    = "vpc-euwe3-dmznonprod"
  project = google_project.host_nonprd_prj.project_id
}
resource "google_compute_subnetwork" "vpc_euwe3_dmznonprod-subnet-dev" {
    name = "vpc_euwe3_dmznonprod-subnet-dev"
    ip_cidr_range = "10.4.0.0/22"
    network = google_compute_network.vpc_euwe3_dmznonprod
    region = "europe-west3"
}
resource "google_compute_subnetwork" "vpc_euwe3_dmznonprod-subnet-qa" {
    name = "vpc_euwe3_dmznonprod-subnet-qa"
    ip_cidr_range = "10.4.4.0/22"
    network = google_compute_network.vpc_euwe3_dmznonprod
    region = "europe-west3"
}
resource "google_compute_subnetwork" "vpc_euwe3_dmznonprod-subnet-uat" {
    name = "vpc_euwe3_dmznonprod-subnet-uat"
    ip_cidr_range = "10.4.8.0/22"
    network = google_compute_network.vpc_euwe3_dmznonprod
    region = "europe-west3"
}
resource "google_compute_subnetwork" "vpc_euwe3_dmznonprod-subnet-shared-services" {
    name = "vpc_euwe3_dmznonprod-subnet-shared-services"
    ip_cidr_range = "10.4.12.0/22"
    network = google_compute_network.vpc_euwe3_dmznonprod
    region = "europe-west3"
}


# Platform Regional VPC and subnet

resource "google_compute_network" "vpc_euwe3_platform" {
  name    = "vpc-euwe3-platform"
  project = google_project.host_platform_prj.project_id
}
resource "google_compute_subnetwork" "vpc_euwe3_platform-subnet" {
    name = "vpc_euwe3_platform-subnet"
    ip_cidr_range = "10.5.0.0/20"
    network = google_compute_network.vpc_euwe3_platform
    region = "europe-west3"
}


resource "google_compute_network" "vpc_euwe3_dmzplatform" {
  name    = "vpc-euwe3-dmzplatform"
  project = google_project.host_platform_prj.project_id
}
resource "google_compute_subnetwork" "vpc_euwe3_dmzplatform-subnet" {
    name = "vpc_euwe3_dmzplatform-subnet"
    ip_cidr_range = "10.5.16.0/20"
    network = google_compute_network.vpc_euwe3_dmzplatform
    region = "europe-west3"
}
