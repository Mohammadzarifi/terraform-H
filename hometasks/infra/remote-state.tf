data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = "for-class"
    key    = "classtasks/session-4/terraform.tfstate"
    region = "us-west-2"
    }
  }
