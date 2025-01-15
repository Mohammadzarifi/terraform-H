terraform {
  backend "s3" {
    bucket = "for-class"
    key    = "classtasks/session-7/modules/qa/terraform.tfstate"
    region = "us-west-2"
  }
}