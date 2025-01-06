provider "google" {
}

terraform {
  backend "gcs" {
    bucket = "tf-cli-statefiles"
    prefix = "backbone/global"
  }
}


