provider "aws" { //default provider conf
<<<<<<< HEAD
  region                   = "us-west-2"
  shared_credentials_files = ["/Users/mohammadzarifi/.aws/credentials"]
  profile                  = "default"
}

provider "aws" { //default provider conf
  alias                    = "oregon"
  region                   = "us-west-2a"
  shared_credentials_files = ["/Users/mohammadzarifi/.aws/credentials"]
  profile                  = "default"
}
=======
  region                   = "us-east-1"
  shared_credentials_files = ["/Users/gulnazzholshy/.aws/credentials"]
  profile                  = "default"
}

provider "aws" {
  alias                    = "ohio"
  region                   = "us-east-2"
  shared_credentials_files = ["/Users/gulnazzholshy/.aws/credentials"]
  profile                  = "default"
}


# provider "google" {
#   alias  = "europe_gcp"
#   region = "europe-west1"
# }
>>>>>>> b051ce993f04500cdf3ea28bf5275c173dcbbe3f
