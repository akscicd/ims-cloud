# Hub VPC and subnet
resource "google_compute_network" "vpc_euwe3_p_hub01" {
  name    = "vpc-euwe3-p-hub01"
  project = "host-hub-prj-18200947911"
  auto_create_subnetworks = false
}
resource "google_compute_subnetwork" "vpc_euwe3_p_hub01_subnet" {
    name = "vpc-euwe3-p-hub01-subnet"
    ip_cidr_range = "10.1.0.0/20"
    network = google_compute_network.vpc_euwe3_p_hub01.name
    project = "host-hub-prj-18200947911"
    region = "europe-west3"
}


resource "google_compute_network" "vpc_euwe3_p_hub02" {
  name    = "vpc-euwe3-p-hub02"
  project = "host-hub-prj-18200947911"
  auto_create_subnetworks = false
}
resource "google_compute_subnetwork" "vpc_euwe3_p_hub02_subnet" {
    name = "vpc-euwe3-p-hub02-subnet"
    ip_cidr_range = "10.1.16.0/20"
    network = google_compute_network.vpc_euwe3_p_hub02.name
    project = "host-hub-prj-18200947911"
    region = "europe-west3"
}





# Prod Regional VPC and subnet

resource "google_compute_network" "vpc_euwe3_prod" {
  name    = "vpc-euwe3-prod"
  project = "host-prd-prj-18200947911"
  auto_create_subnetworks = false
}
resource "google_compute_subnetwork" "vpc_euwe3_prod_subnet" {
    name = "vpc-euwe3-prod-subnet"
    ip_cidr_range = "10.2.0.0/20"
    network = google_compute_network.vpc_euwe3_prod.name
    project = "host-prd-prj-18200947911"
    region = "europe-west3"
}


resource "google_compute_network" "vpc_euwe3_dmzprod" {
  name    = "vpc-euwe3-dmzprod"
  project = "host-prd-prj-18200947911"
  auto_create_subnetworks = false
}
resource "google_compute_subnetwork" "vpc_euwe3_dmzprod_subnet" {
    name = "vpc-euwe3-dmzprod-subnet"
    ip_cidr_range = "10.2.16.0/20"
    network = google_compute_network.vpc_euwe3_dmzprod.name
    project = "host-prd-prj-18200947911"
    region = "europe-west3"
}


# Nonprod Regional VPC and subnets

resource "google_compute_network" "vpc_euwe3_nonprod" {
  name    = "vpc-euwe3-nonprod"
  project = "host-nonprd-prj-18200947911"
  auto_create_subnetworks = false
}
resource "google_compute_subnetwork" "vpc_euwe3_nonprod_subnet_dev" {
    name = "vpc-euwe3-nonprod-subnet-dev"
    ip_cidr_range = "10.3.0.0/22"
    network = google_compute_network.vpc_euwe3_nonprod.name
    project = "host-nonprd-prj-18200947911"
    region = "europe-west3"
}
resource "google_compute_subnetwork" "vpc_euwe3_nonprod_subnet_qa" {
    name = "vpc-euwe3-nonprod-subnet-qa"
    ip_cidr_range = "10.3.4.0/22"
    network = google_compute_network.vpc_euwe3_nonprod.name
    project = "host-nonprd-prj-18200947911"
    region = "europe-west3"
}
resource "google_compute_subnetwork" "vpc_euwe3_nonprod_subnet_uat" {
    name = "vpc-euwe3-nonprod-subnet-uat"
    ip_cidr_range = "10.3.8.0/22"
    network = google_compute_network.vpc_euwe3_nonprod.name
    project = "host-nonprd-prj-18200947911"
    region = "europe-west3"
}
resource "google_compute_subnetwork" "vpc_euwe3_nonprod_subnet_shared_services" {
    name = "vpc-euwe3-nonprod-subnet-shared-services"
    ip_cidr_range = "10.3.12.0/22"
    network = google_compute_network.vpc_euwe3_nonprod.name
    project = "host-nonprd-prj-18200947911"
    region = "europe-west3"
}



resource "google_compute_network" "vpc_euwe3_dmznonprod" {
  name    = "vpc-euwe3-dmznonprod"
  project = "host-nonprd-prj-18200947911"
  auto_create_subnetworks = false
}
resource "google_compute_subnetwork" "vpc_euwe3_dmznonprod_subnet_dev" {
    name = "vpc-euwe3-dmznonprod-subnet-dev"
    ip_cidr_range = "10.4.0.0/22"
    network = google_compute_network.vpc_euwe3_dmznonprod.name
    project = "host-nonprd-prj-18200947911"
    region = "europe-west3"
}
resource "google_compute_subnetwork" "vpc_euwe3_dmznonprod_subnet_qa" {
    name = "vpc-euwe3-dmznonprod-subnet-qa"
    ip_cidr_range = "10.4.4.0/22"
    network = google_compute_network.vpc_euwe3_dmznonprod.name
    project = "host-nonprd-prj-18200947911"
    region = "europe-west3"
}
resource "google_compute_subnetwork" "vpc_euwe3_dmznonprod_subnet_uat" {
    name = "vpc-euwe3-dmznonprod-subnet-uat"
    ip_cidr_range = "10.4.8.0/22"
    network = google_compute_network.vpc_euwe3_dmznonprod.name
    project = "host-nonprd-prj-18200947911"
    region = "europe-west3"
}
resource "google_compute_subnetwork" "vpc_euwe3_dmznonprod_subnet_shared_services" {
    name = "vpc-euwe3-dmznonprod-subnet-shared-services"
    ip_cidr_range = "10.4.12.0/22"
    network = google_compute_network.vpc_euwe3_dmznonprod.name
    project = "host-nonprd-prj-18200947911"
    region = "europe-west3"
}


# Platform Regional VPC and subnet

resource "google_compute_network" "vpc_euwe3_platform" {
  name    = "vpc-euwe3-platform"
  project = "host-platform-prj-18200947911"
  auto_create_subnetworks = false
}
resource "google_compute_subnetwork" "vpc_euwe3_platform_subnet" {
    name = "vpc-euwe3-platform-subnet"
    ip_cidr_range = "10.5.0.0/20"
    network = google_compute_network.vpc_euwe3_platform.name
    project = "host-platform-prj-18200947911"
    region = "europe-west3"
}


resource "google_compute_network" "vpc_euwe3_dmzplatform" {
  name    = "vpc-euwe3-dmzplatform"
  project = "host-platform-prj-18200947911"
  auto_create_subnetworks = false
}
resource "google_compute_subnetwork" "vpc_euwe3_dmzplatform_subnet" {
    name = "vpc-euwe3-dmzplatform-subnet"
    ip_cidr_range = "10.5.16.0/20"
    network = google_compute_network.vpc_euwe3_dmzplatform.name
    project = "host-platform-prj-18200947911"
    region = "europe-west3"
}
