module "vpc" {
  //Required
  source = "github.com/Mohammadzarifi/terraform-H/tree/main/classtask/session-7/modules"



  //variables
  env = "dev"
  vpc_name = "My-VPC"
  subnets_az = ["us-west-2", "us-west-2b", "us-west-12c"]
  subnet_name = [1, 2, 3]
  vpc_cidr = "10.0.0.0/16"
  public_subnet_cidr_block = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidr_block = ["10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24"]

}

/*

?ref=v1.2.0
?ref=COMMIT_HASH
?ref=BRANCH_NAME

*/