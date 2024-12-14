locals {
  # Ensure the EBS volume uses the same AZ as the EC2 instance
  az_name = aws_instance.example.availability_zone
}

# Create a security group allowing SSH access
resource "aws_security_group" "example" {
  name_prefix = "chichao-sg"
  description = "Allow SSH access"
  vpc_id      = data.aws_vpc.shared.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow SSH from all IPs
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create an EC2 instance in the first available public subnet
resource "aws_instance" "example" {
  ami                    = "ami-0f935a2ecd3a7bd5c" # Replace with a valid AMI ID for your region
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = local.public_subnet_id
  vpc_security_group_ids = [aws_security_group.example.id] # Use security group IDs for precision

   # Force assignment of a public IP address
  associate_public_ip_address = true

  tags = {
    Name = "ChichaoEBSExampleInstance"
  }
}


# Create a 1 GB EBS volume in the same availability zone as the EC2 instance
resource "aws_ebs_volume" "example" {
  availability_zone = local.az_name
  size              = var.volume_size
  tags              = var.volume_tags
}

# Attach the EBS volume to the EC2 instance
resource "aws_volume_attachment" "example" {
  device_name = var.device_name
  volume_id   = aws_ebs_volume.example.id
  instance_id = aws_instance.example.id
}
