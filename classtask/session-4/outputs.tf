<<<<<<< HEAD
# output "ec2_public_ip_dev" {
#   value       = aws_instance.web.public_ip
#   description = "This is my public IP of dev instance"
# }

# output "private_ip_qa" {
#   value = aws_instance.web.private_ip
# }

# output "arn_prod_instance" {
#   value = aws_instance.web.arn
# }

# output "stage_instance_id" {
#   value = aws_instance.web.id
# }

# output "az_all_instances" {                    # Note this might not be applicable with single instance
#   value = [aws_instance.web.availability_zone] # Wrap it in list to avoid errors
# }
=======
output "ec2_public_ip_dev" {
  value       = aws_instance.web[0].public_ip
  description = "This is my public IP of dev instance"
}

output "private_ip_qa" {
  value = aws_instance.web[1].private_ip
}

output "arn_prod_instance" {
  value = aws_instance.web.2.arn
}

output "stage_instance_id" {
  value = aws_instance.web.3.id
}

output "az_all_instances" {
  value = aws_instance.web[*].availability_zone
}

/*

Classtask 1

1. output the  public_ip of dev instance
2. output the private_ip of qa instance
3. output the ARN of prod instance
4. output the instance_id of stage instance
5. output the AZ of all instances

*/
>>>>>>> b051ce993f04500cdf3ea28bf5275c173dcbbe3f
