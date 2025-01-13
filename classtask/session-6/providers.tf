provider "aws" { 
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


