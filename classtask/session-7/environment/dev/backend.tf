terraform {
  backend "s3" {
    bucket = "for-class"
    key    = "classtasks/session-7/terraform-H.tfstate"
    region = "us-west-2"
  }
}