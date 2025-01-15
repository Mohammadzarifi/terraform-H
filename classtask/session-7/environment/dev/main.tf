module "main" {
  // arguments (Required)
  source = "../../modules/webserver"

  //variables (Optional)
  subnet_id = module.vpc.public_subnet_ids[0]
  my_vpc_id = module.vpc.vpc_id

}

module "vpc" {
  //Required
  source = "../../modules/vpc"

  //variables
  env = "dev"
  vpc_name = "My-VPC"
  subnets_az = ["us-east-1a", "us-east-1b", "us-east-1c"]
  subnet_name = [1, 2, 3]
  vpc_cidr = "10.0.0.0/16"
  public_subnet_cidr_block = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidr_block = ["10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24"]

}

/*
Sources:
1. local -> give a path to chile module 
2. Terraform registry
3. Remote (VCS, Github)


Reference module output:
module.<module_name>.<output_name>
*/