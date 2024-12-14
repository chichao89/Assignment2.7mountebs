variable "aws_region" {
  default     = "ap-southeast-1" # Singapore Region
  description = "AWS region where resources will be provisioned"
}

variable "instance_type" {
  default     = "t2.micro"
  description = "Instance type for the EC2 instance"
}

variable "key_name" {
  default = "chichao-new"
  description = "The key pair name for accessing the EC2 instance"
}

variable "volume_size" {
  default     = 1
  description = "Size of the EBS volume in GB"
}

variable "volume_tags" {
  default     = { Name = "ChiChaoExampleEBSVolume" }
  description = "Tags to assign to the EBS volume"
}

variable "device_name" {
  default     = "/dev/xvdf"
  description = "The device name for the EBS volume attachment"
}
