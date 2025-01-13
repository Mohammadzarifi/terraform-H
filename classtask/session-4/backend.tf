terraform {
  backend "s3" {
<<<<<<< HEAD
    bucket = "for-class"
    key    = "classtasks/session-4/terraform.tfstate"
    region = "us-west-2"
=======
    bucket = "terraform-aug24-123456789"
    key    = "classtasks/session-4/terraform.tfstate"
    region = "us-east-1"
>>>>>>> b051ce993f04500cdf3ea28bf5275c173dcbbe3f
  }
}