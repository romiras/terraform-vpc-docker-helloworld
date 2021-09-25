variable "profile" {
  description = "AWS profile, must pass on command line using -var"
  type        = string
}

variable "aws_access_key" {
  description = "AWS access key, must pass on command line using -var"
  type        = string
}

variable "aws_secret_key" {
  description = "AWS secret access key, must pass on command line using -var"
  type        = string
}

variable "aws_region" {
  description = "EU Central"
  default     = "eu-central-1"
}

# dynamically retrieves all availability zones for current region
#data "aws_availability_zones" "available" {}

# specifying AZs 
#   comment off this "azs" to retrive all AZs dynamically (uncomment the line above "data ...")
variable "azs" {
  type    = list(string)
  default = ["eu-central-1a", "eu-central-1b"]
}

variable "ec2_amis" {
  description = "Ubuntu Server 20.04 LTS (HVM)"
  type        = map(string)

  default = {
    "us-east-1"    = "ami-03a80f322a6053f85"
    "us-east-2"    = "ami-0a5a9780e8617afe7"
    "us-west-1"    = "ami-02c160578d2b40098"
    "us-west-2"    = "ami-0ceee60bcb94f60cd"
    "eu-central-1" = "ami-091f21ecba031b39a"
  }
}

variable "public_subnets_cidr" {
  type    = list(string)
  default = ["10.0.0.0/24", "10.0.2.0/24", "10.0.4.0/24"]
}

variable "private_subnets_cidr" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.3.0/24", "10.0.5.0/24"]
}

variable "instance_name_prefix" {
  type        = string
  default     = "docker-nginx-demo-instance"
  description = "Prefix of instance name"
}

variable "instance_type" {
  type    = string
  default = "t2.nano"
}
