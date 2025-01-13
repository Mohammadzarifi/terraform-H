variable "instance_type" {
<<<<<<< HEAD
  type        = string
  default     = "t2.micro"
=======
  type = string
    default = "t2.micro"
>>>>>>> b051ce993f04500cdf3ea28bf5275c173dcbbe3f
  description = "This is Instance Type"
}

variable "instance_name" {
  type        = string
<<<<<<< HEAD
  default     = "my"
=======
  default     = "My-Webserver"
>>>>>>> b051ce993f04500cdf3ea28bf5275c173dcbbe3f
  description = "This is My Webserver"
}

variable "security_group_name" {
  type        = string
  default     = "MySG"
  description = "This is My Security Group"
}

<<<<<<< HEAD

variable "env" {
  type        = list(string)
  default     = ["dev", "qa", "prod",]  # Change this list as needed
  description = "This is My Dev Environment"
}
# variable "ports" {
#   type        = list(number)
#   default     = [22, 80, 443, 3369]
#   description = "List of ports"
# }

# variable "cidrs" {
#   type        = list(string)
#   default     = ["0.0.0.0/0", "73.74.183.123/32", "0.0.0.0/0", "0.0.0.0/0"]
#   description = "List of CIDRs"
# }
=======
variable "env" {
  type        = list(string)
  default     = ["dev", "qa", "prod", "stage"]
  description = "This is My Dev Environment"
}

variable "ports" {
  type = list(number)
  default = [22, 80, 443, 3369]
  description = "List of ports"
}

variable "cidrs" {
  type = list(string)
  default = ["0.0.0.0/0","73.74.183.123/32","0.0.0.0/0","0.0.0.0/0"]
  description = "List of ports"
}
>>>>>>> b051ce993f04500cdf3ea28bf5275c173dcbbe3f
