/*
this block of code fetches it's needed conf from 
#terraform-H/hometasks/homework-4

*/


data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = "for-class"
    key    = "classtasks/session-4/terraform.tfstate"
    region = "us-west-2"
    }
  }




