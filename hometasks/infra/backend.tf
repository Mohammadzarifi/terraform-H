terraform {
  backend "s3" {
    bucket = "for-class"
    key    = "hometasks/infras/terraform.tfstate"
    region = "us-west-2"
  }
}
