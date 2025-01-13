locals  {
   common_tags  = {
      Env = var.env
      Department = var.department
      Team = var.team
      Project = var.project
      ManagedBy = var.managed_by
      Owner = var.owner
   }

}

locals {
   Name = "${var.cloud}-${var.region}-${var.team}-${var.env}-${var.app_tier}-%s"
}



/*
Naming Standards
1. Cloud Provider: aws, gcp, etc
2. Region: use1, usw2 etc
3. Team: DevOps, Qa
4. Environment: dev, qa, stage etc
5. Project Name: instagram, etc
6. Application Tier: backend, frontend etc
7. Resource Name: ec2, s3, rds etc


EC2 instance:
aws-use1-devops-qa-skylight-frontend-ec2

S3 bucket:
aws-usw2-devops-dev-skylight-backend-s3

Tagging Standards 
1.Environment: dev, qa
2. Department: finance, marketing, hr
3. Team: devops, finance
4. Project: skylight
5. ManagedBy: terraform, cloudformation, manual
6. Owner: Gulnaz



ClassTask 1:
Apply Naming and Tagging Standards to EC2, SG



Ternary Syntax: 
<consition> ? true_value : false_value
a == b ? true : false

1 == 1 ? true : false (true)
1 == 2 ? true : false (false)


ClassTask:
if env == prod instance.type == t2.mediim
else instance_type = t2.micro

*/

