# variable "public_subnet_cidr_blocks" {
#   type        = list(string)
#   default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
#   description = "List of public subnet CIDR blocks"
# }

# variable "private_subnet_cidr_blocks" {
#   type        = list(string)
#   default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
#   description = "List of private subnet CIDR blocks"
# }


variable "env" {
  description = "The environment (e.g., dev, stage, prod)"
  type        = string
}

variable "department" {
  description = "The department responsible for the resource"
  type        = string
}

variable "team" {
  description = "The team responsible for the resource"
  type        = string
}

variable "project" {
  description = "The project name"
  type        = string
}

variable "managed_by" {
  description = "The manager or team managing the resource"
  type        = string
}

variable "owner" {
  description = "The owner of the resource"
  type        = string
}

variable "resource_type" {
  description = "The type of resource being managed"
  type        = string
}

variable "cloud" {
  description = "The cloud provider (e.g., aws, azure, gcp)"
  type        = string
}

variable "region" {
  description = "The cloud region"
  type        = string
}

variable "app_tier" {
  description = "The application tier (e.g., web, app, db)"
  type        = string
}

variable "public_subnet_cidr_blocks" {
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  description = "List of public subnet CIDR blocks"
}

variable "private_subnet_cidr_blocks" {
  type        = list(string)
  default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  description = "List of private subnet CIDR blocks"
}
