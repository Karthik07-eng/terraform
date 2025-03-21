provider "aws" {
  region = "ap-south-1"
}

# Create VPC
module "vpc" {
  source      = "./modules/vpc"
  cidr_block  = "192.168.0.0/16"
  vpc_name    = "My-VPC"
}

# Create EC2 instance inside the VPC
module "ec2" {
  source        = "./modules/ec2-instances"
  ami           = "ami-08fe5144e4659a3b3"
  instance_type = "t2.micro"
  subnet_id     = subnet-01e8d0e330b25c6f3
  instance_name = "Web-Server"
}

# Create S3 Bucket
module "s3" {
  source      = "./modules/s3-bucket"
  bucket_name = "my-awesome-bucket-reya"
}

output "ec2_public_ip" {
  value = module.ec2.public_ip
}

output "s3_bucket_arn" {
  value = module.s3.bucket_arn
}
