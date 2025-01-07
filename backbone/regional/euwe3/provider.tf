provider "google" {
}

terraform {
  backend "gcs" {
    bucket = "tf-cli-statefiles"
    prefix = "backbone/regional/euwe3"
  }
}
