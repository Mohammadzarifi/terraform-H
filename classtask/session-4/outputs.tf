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
