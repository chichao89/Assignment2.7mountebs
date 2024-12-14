# Fetch the VPC ID for the VPC named "shared-vpc"
data "aws_vpc" "shared" {
  filter {
    name   = "tag:Name"
    values = ["shared-vpc"]
  }
}
# Fetch all public subnets in the current AWS region
data "aws_subnets" "public" {
  filter {
    name   = "tag:Name"
    values = ["*public*"] # Adjust based on your public subnet naming convention
  }

    filter {
    name   = "vpc-id"
    values = [data.aws_vpc.shared.id]
  }
}

# Select the first available public subnet ID
locals {
  public_subnet_id = data.aws_subnets.public.ids[0]
}
