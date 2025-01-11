module "main" {
  //arguments 
  source = "../../modules/webserver"

  //variables 
  instance_type = "t2.medium"
  env = "prod"

}

/*
Sources:
1. local -> give a path to chile module 
2. Terraform registry
3. Remote (VCS, Github)
*/