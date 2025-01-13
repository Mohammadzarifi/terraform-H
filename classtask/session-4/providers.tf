provider "aws" { //default provider conf
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
