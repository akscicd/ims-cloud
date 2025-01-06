variable "org_id" {
  default = 18200947911
  type    = number
}
##########################1. Folders####################################
resource "google_folder" "prod" {
  display_name = "Prod"
  parent       = "organizations/${var.org_id}"
  deletion_protection=false
}

resource "google_folder" "nonprod" {
  display_name = "Nonprod"
  parent       = "organizations/${var.org_id}"
  deletion_protection=false
}

resource "google_folder" "platform" {
  display_name = "Platform"
  parent       = "organizations/${var.org_id}"
  deletion_protection=false
}

resource "google_folder" "seed" {
  display_name = "Seed"
  parent       = "organizations/${var.org_id}"
  deletion_protection=false
}
##########################End Folders####################################

###################Seed Project and Storage Bucket#######################
resource "google_project" "seed_project" {
  name       = "Seed"
  project_id = "seed-project-${var.org_id}"
  folder_id  = google_folder.seed.id
  billing_account = "01DE66-1FC153-2D75CA"
}
resource "google_project_service" "seed_cloudresourcemanager" {
  project = google_project.seed_project.project_id
  service = "cloudresourcemanager.googleapis.com"
}



resource "google_storage_bucket" "tf_cli_statefiles" {
  name     = "tf-cli-statefiles"
  location = "US"
  project  = google_project.seed_project.project_id
  uniform_bucket_level_access = true
}

###################End of Seed Project and Storage Bucket#######################

####################Hub Project and Global VPCs#################################
resource "google_project" "host_hub_prj" {
  name       = "host-hub-prj"
  project_id = "host-hub-prj-${var.org_id}"
  folder_id  = google_folder.platform.id
  billing_account = "01DE66-1FC153-2D75CA"
}
resource "google_project_service" "host_hub_prj_compute" {
  project = google_project.host_hub_prj.project_id
  service = "compute.googleapis.com"
}
resource "google_project_service" "host_hub_prj_cloudresourcemanager" {
  project = google_project.host_hub_prj.project_id
  service = "cloudresourcemanager.googleapis.com"
}



resource "google_compute_network" "vpc_glbl_p_untrust" {
  name                    = "vpc-glbl-p-untrust"
  project                 = google_project.host_hub_prj.project_id
  auto_create_subnetworks = false
}
resource "google_compute_subnetwork" "vpc_glbl_p_untrust-subnet" {
  name          = "vpc-glbl-p-untrust-subnet"
  ip_cidr_range = "10.0.0.0/20"
  network       = google_compute_network.vpc_glbl_p_untrust.name
  project       = google_project.host_hub_prj.project_id
  region        = "europe-west3"
}


resource "google_compute_network" "vpc_glbl_p_transit" {
  name                    = "vpc-glbl-p-transit"
  project                 = google_project.host_hub_prj.project_id
  auto_create_subnetworks = false
}
resource "google_compute_subnetwork" "vpc_glbl_p_transit-subnet" {
  name          = "vpc-glbl-p-transit-subnet"
  ip_cidr_range = "10.0.16.0/20"
  network       = google_compute_network.vpc_glbl_p_transit.name
  project       = google_project.host_hub_prj.project_id
  region        = "europe-west3"
}

resource "google_compute_network" "vpc_glbl_p_mgmt" {
  name                    = "vpc-glbl-p-mgmt"
  project                 = google_project.host_hub_prj.project_id
  auto_create_subnetworks = false
}
resource "google_compute_subnetwork" "vpc_glbl_p_mgmt-subnet" {
  name          = "vpc-glbl-p-mgmt-subnet"
  ip_cidr_range = "10.0.32.0/20"
  network       = google_compute_network.vpc_glbl_p_mgmt.name
  project       = google_project.host_hub_prj.project_id
  region        = "europe-west3"
}

####################End of Hub Project and Global VPCs#################################


#############################Spoke Projects##############################################

#Prod Project Spoke
resource "google_project" "host_prd_prj" {
  name       = "host-prd-prj"
  project_id = "host-prd-prj-${var.org_id}"
  folder_id  = google_folder.prod.id
  billing_account = "01DE66-1FC153-2D75CA"
}
resource "google_project_service" "host_prd_prj_compute" {
  project = google_project.host_prd_prj.project_id
  service = "compute.googleapis.com"
}
resource "google_project_service" "host_prd_prj_cloudresourcemanager" {
  project = google_project.host_prd_prj.project_id
  service = "cloudresourcemanager.googleapis.com"
}

#Nonprod Project Spoke
resource "google_project" "host_nonprd_prj" {
  name       = "host-nonprd-prj"
  project_id = "host-nonprd-prj-${var.org_id}"
  folder_id  = google_folder.nonprod.id
  billing_account = "01DE66-1FC153-2D75CA"
}
resource "google_project_service" "host_nonprd_prj_compute" {
  project = google_project.host_nonprd_prj.project_id
  service = "compute.googleapis.com"
}
resource "google_project_service" "host_nonprd_prj_cloudresourcemanager" {
  project = google_project.host_nonprd_prj.project_id
  service = "cloudresourcemanager.googleapis.com"
}


#Platform Project Spoke
resource "google_project" "host_platform_prj" {
  name       = "host-platform-prj"
  project_id = "host-platform-prj-${var.org_id}"
  folder_id  = google_folder.platform.id
  billing_account = "01DE66-1FC153-2D75CA"
}
resource "google_project_service" "host_platform_prj_compute" {
  project = google_project.host_platform_prj.project_id
  service = "compute.googleapis.com"
}
resource "google_project_service" "host_platform_prj_cloudresourcemanager" {
  project = google_project.host_platform_prj.project_id
  service = "cloudresourcemanager.googleapis.com"
}

#############################End of Spoke Projects##############################################