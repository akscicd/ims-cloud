provider "google" {
}

terraform {
  backend "gcs" {
    bucket = "tf-cli-statefiles"
    prefix = "project01-webserver"
  }
}


