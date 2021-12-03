variable "public_subnet_id" {
  description = "Public Subnet Id. This is an output of the terraform-aws-public-subnet module"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID as assigned by AWS. This is an output of the terraform-aws-vpc module"
  type        = string
}

variable "ssh_access" {
  description = "CIDR Mask of hosts that are able to connect to Bastion Host with SSH"
  type        = string
}

variable "instance_type" {
  description = "Bastion Host Instance Type"
  default     = "m1.large"
  type        = string
}

variable "key_name" {
  description = "Name of the SSH KeyPair that the Bastion host will use. This must already exist in AWS"
  type        = string
}

variable "admin_sg" {
  description = "This is a security group that is within the private subnet that this bastion host will connect to. Any ec2 instance that has this security group will allow ssh access from the bastion host"
  type        = string
}

variable "resource_tags" {
  description = "Optional map of tags to set on resources, defaults to empty map."
  type        = map
  default     = {}
}

variable "network_name" {
  description = "Name of the network this bastion host will allow access to"
  type        = string
}
