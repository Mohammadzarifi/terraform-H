output "ec2_public_ip" {
    value = aws_instance.web.public_ip
    description = "This is public IP"
}

output "default_vpc_arn" {
    value = data.aws_vpc.default_vpc.arn
}

output "sg_id" {
  value = aws_security_group.web.id
}


/*
Outputs
outputtin any attributes

*/
