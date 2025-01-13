# Environment Variable
variable "env" {
  type = string
  # default     = "Dev"
  description = "This is My Dev Environment"
}

# VPC Name Variable
variable "vpc_name" {
  type = string
  # default     = "My-VPC"
  description = "This is Homework-3 VPC"
}


# Public/Private Subnets' AZs
variable "subnets_az" {
  type = list(string)
  # default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
  description = "Public Subnets Avaialability Zones"
}

# Public/Private Subnets Name
variable "subnet_name" {
  type = list(number)
  # default = [1, 2, 3]
}

variable "vpc_cidr" {
  type = string
  # default = "10.0.0.0/16"
}

# Public Subnets CIDR Blocks
variable "public_subnet_cidr_block" {
  type = list(string)
  # default     = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
  description = "List of Public Subnets' CIDR Block"
}

# Private Subnets CIDR Blocks
variable "private_subnet_cidr_block" {
  type = list(string)
  # default     = ["10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24"]
  description = "List of Private Subnets' CIDR Block"
}