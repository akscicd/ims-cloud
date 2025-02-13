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
resource "google_compute_subnetwork" "vpc_glbl_p_untrust_subnet_euwe3" {
  name          = "vpc-glbl-p-untrust-subnet-euwe3"
  ip_cidr_range = "10.0.0.0/20"
  network       = google_compute_network.vpc_glbl_p_untrust.name
  project       = google_project.host_hub_prj.project_id
  region        = "europe-west3"
}
resource "google_compute_subnetwork" "vpc_glbl_p_untrust_subnet_euwe1" {
  name          = "vpc-glbl-p-untrust-subnet-euwe1"
  ip_cidr_range = "20.0.0.0/20"
  network       = google_compute_network.vpc_glbl_p_untrust.name
  project       = google_project.host_hub_prj.project_id
  region        = "europe-west1"
}
resource "google_compute_subnetwork" "vpc_glbl_p_untrust_subnet_usea1" {
  name          = "vpc-glbl-p-untrust-subnet-usea1"
  ip_cidr_range = "30.0.0.0/20"
  network       = google_compute_network.vpc_glbl_p_untrust.name
  project       = google_project.host_hub_prj.project_id
  region        = "us-east1"
}
resource "google_compute_subnetwork" "vpc_glbl_p_untrust_subnet_usea4" {
  name          = "vpc-glbl-p-untrust-subnet-usea4"
  ip_cidr_range = "40.0.0.0/20"
  network       = google_compute_network.vpc_glbl_p_untrust.name
  project       = google_project.host_hub_prj.project_id
  region        = "us-east4"
}
resource "google_compute_subnetwork" "vpc_glbl_p_untrust_subnet_asso1" {
  name          = "vpc-glbl-p-untrust-subnet-asso1"
  ip_cidr_range = "50.0.0.0/20"
  network       = google_compute_network.vpc_glbl_p_untrust.name
  project       = google_project.host_hub_prj.project_id
  region        = "asia-southeast1"
}
resource "google_compute_subnetwork" "vpc_glbl_p_untrust_subnet_asso2" {
  name          = "vpc-glbl-p-untrust-subnet-asso2"
  ip_cidr_range = "60.0.0.0/20"
  network       = google_compute_network.vpc_glbl_p_untrust.name
  project       = google_project.host_hub_prj.project_id
  region        = "asia-southeast2"
}


resource "google_compute_network" "vpc_glbl_p_transit" {
  name                    = "vpc-glbl-p-transit"
  project                 = google_project.host_hub_prj.project_id
  auto_create_subnetworks = false
}
resource "google_compute_subnetwork" "vpc_glbl_p_transit_subnet_euwe3" {
  name          = "vpc-glbl-p-transit-subnet-euwe3"
  ip_cidr_range = "10.0.16.0/20"
  network       = google_compute_network.vpc_glbl_p_transit.name
  project       = google_project.host_hub_prj.project_id
  region        = "europe-west3"
}
resource "google_compute_subnetwork" "vpc_glbl_p_transit_subnet_euwe1" {
  name          = "vpc-glbl-p-transit-subnet-euwe1"
  ip_cidr_range = "20.0.16.0/20"
  network       = google_compute_network.vpc_glbl_p_transit.name
  project       = google_project.host_hub_prj.project_id
  region        = "europe-west1"
}
resource "google_compute_subnetwork" "vpc_glbl_p_transit_subnet_usea1" {
  name          = "vpc-glbl-p-transit-subnet-usea1"
  ip_cidr_range = "30.0.16.0/20"
  network       = google_compute_network.vpc_glbl_p_transit.name
  project       = google_project.host_hub_prj.project_id
  region        = "us-east1"
}
resource "google_compute_subnetwork" "vpc_glbl_p_transit_subnet_usea4" {
  name          = "vpc-glbl-p-transit-subnet-usea4"
  ip_cidr_range = "40.0.16.0/20"
  network       = google_compute_network.vpc_glbl_p_transit.name
  project       = google_project.host_hub_prj.project_id
  region        = "us-east4"
}
resource "google_compute_subnetwork" "vpc_glbl_p_transit_subnet_aaso1" {
  name          = "vpc-glbl-p-transit-subnet-asso1"
  ip_cidr_range = "50.0.16.0/20"
  network       = google_compute_network.vpc_glbl_p_transit.name
  project       = google_project.host_hub_prj.project_id
  region        = "asia-southeast1"
}
resource "google_compute_subnetwork" "vpc_glbl_p_transit_subnet_asso2" {
  name          = "vpc-glbl-p-transit-subnet-asso2"
  ip_cidr_range = "60.0.16.0/20"
  network       = google_compute_network.vpc_glbl_p_transit.name
  project       = google_project.host_hub_prj.project_id
  region        = "asia-southeast2"
}



resource "google_compute_network" "vpc_glbl_p_mgmt" {
  name                    = "vpc-glbl-p-mgmt"
  project                 = google_project.host_hub_prj.project_id
  auto_create_subnetworks = false
}
resource "google_compute_subnetwork" "vpc_glbl_p_mgmt_subnet_euwe3" {
  name          = "vpc-glbl-p-mgmt-subnet-euwe3"
  ip_cidr_range = "10.0.32.0/20"
  network       = google_compute_network.vpc_glbl_p_mgmt.name
  project       = google_project.host_hub_prj.project_id
  region        = "europe-west3"
}
resource "google_compute_subnetwork" "vpc_glbl_p_mgmt_subnet_euwe1" {
  name          = "vpc-glbl-p-mgmt-subnet-euwe1"
  ip_cidr_range = "20.0.32.0/20"
  network       = google_compute_network.vpc_glbl_p_mgmt.name
  project       = google_project.host_hub_prj.project_id
  region        = "europe-west1"
}
resource "google_compute_subnetwork" "vpc_glbl_p_mgmt_subnet_usea1" {
  name          = "vpc-glbl-p-mgmt-subnet-usea1"
  ip_cidr_range = "30.0.32.0/20"
  network       = google_compute_network.vpc_glbl_p_mgmt.name
  project       = google_project.host_hub_prj.project_id
  region        = "us-east1"
}
resource "google_compute_subnetwork" "vpc_glbl_p_mgmt_subnet_usea4" {
  name          = "vpc-glbl-p-mgmt-subnet-usea4"
  ip_cidr_range = "40.0.32.0/20"
  network       = google_compute_network.vpc_glbl_p_mgmt.name
  project       = google_project.host_hub_prj.project_id
  region        = "us-east4"
}
resource "google_compute_subnetwork" "vpc_glbl_p_mgmt_subnet_asso1" {
  name          = "vpc-glbl-p-mgmt-subnet-asso1"
  ip_cidr_range = "50.0.32.0/20"
  network       = google_compute_network.vpc_glbl_p_mgmt.name
  project       = google_project.host_hub_prj.project_id
  region        = "asia-southeast1"
}
resource "google_compute_subnetwork" "vpc_glbl_p_mgmt_subnet_asso2" {
  name          = "vpc-glbl-p-mgmt-subnet-asso2"
  ip_cidr_range = "60.0.32.0/20"
  network       = google_compute_network.vpc_glbl_p_mgmt.name
  project       = google_project.host_hub_prj.project_id
  region        = "asia-southeast2"
}


resource "google_compute_firewall" "allow_ssh_iap_https_vpc_glbl_p_mgmt" {
  name    = "allow-ssh-iap-https-vpc-glbl-p-mgmt"
  network = google_compute_network.vpc_glbl_p_mgmt.name

  allow {
    protocol = "tcp"
    ports    = ["22", "443"]
  }
  target_tags = ["palo-alto-fw"]
  source_ranges = ["0.0.0.0/0", "35.235.240.0/20"]
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

############################# Firewall configs start ##############################################

resource "google_compute_instance" "palo_alto_vmseries_fw" {
  name         = "palo-alto-vmseries-fw"
  machine_type = "n2-standard-4"
  zone         = "europe-west3-b"
  project = "host-hub-prj-18200947911"

  boot_disk {
    initialize_params {
      image = "projects/mpi-paloaltonetworksgcp-public/global/images/vmseries-flex-bundle2-1123h3"
      size = 60
      type = "pd-ssd"
    }
  }

  network_interface {
    #mgmt
    network       = google_compute_network.vpc_glbl_p_mgmt.name
    subnetwork = google_compute_subnetwork.vpc_glbl_p_mgmt_subnet_euwe3.name
    access_config {
    }
  }

  network_interface {
    #untrust
    network       = google_compute_network.vpc_glbl_p_untrust.name
    subnetwork = google_compute_subnetwork.vpc_glbl_p_untrust_subnet_euwe3.name
    access_config {
    }
  }

    network_interface {
    #hub1
    network = "vpc-euwe3-p-hub01"
    subnetwork = "vpc-euwe3-p-hub01-subnet"
  }
    network_interface {
    #hub2
    network = "vpc-euwe3-p-hub02"
    subnetwork = "vpc-euwe3-p-hub02-subnet"
  }

##commenting this because this vm type only supports 4 nw interfaces i.e. 0,1,2,3
//  network_interface {
//  #transit
//  network       = google_compute_network.vpc_glbl_p_transit.name
//  subnetwork = google_compute_subnetwork.vpc_glbl_p_transit_subnet_euwe3.name
//  }
//
  metadata = {
    ssh-keys = "admin:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCh4TscUxwqcvTpYWV01FaygayFZypp3IK/eUK7XIxuz72xyRdMdFJ/IOV98a7WtZHLVt+wnbi/cfRFmGsYcMBrMb1GrlThv7/y5jxPTapsOrcyRwpSmZ7ugkY0cGlE++LZRt5S/vjgw9dChvwT1rP3ljTC3a8V095Wl6609meJ5OCcr7eHz/boBbS2ZAfN1ij55z55kYHB3lp1z7ZCcPr3MdLrKbIRPQ+KbiPKxC0mSekTgmRRE+o879jfTDXoQD00zti1TwMqbLtySveQ4inXL5qJ8Mxqjl9BOOycD3+/RVzjLas/TAQ/cpnDA3pWr74tqISMNzGGLmTxrSQE1FTd rsa-key-20250108 admin"
  }

  tags = ["palo-alto-fw"]

}
############################# Firewall configs end ##############################################
