terraform {
  backend "s3" {
    bucket = "for-class"
    key    = "classtask/session-7/modules/prod/terraform.tfstate"
    region = "us-west-2"
  }
}