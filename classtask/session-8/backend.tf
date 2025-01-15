terraform {
  backend "s3" {
    bucket = "for-class"
    key    = "classtasks/session-8/terraform.tfstate"
    region = "us-west-2"
  }
}