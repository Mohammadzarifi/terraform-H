resource "aws_instance" "web" {
  ami           = "ami-00263d65d34554146"
  instance_type = "t2.micro"
}




/*
resource - block 
aws_instance - first label, resource type defined by Terraform
web - second label, logical name/ID, resource name defined by you, has to be unique in the conf files 
ami, instance_type - arguments, properties 
argument value = string, boolean, number etc


Semantic Versioning:

Instagram Version: 2.34.5

2 - major, big changes, upgrades
34 - minor, new featues
5 - patch, bug fixes 



required_version=">= 5.75.0 , < 5.80.0"
required_version="~> 5.76.0" 

*/