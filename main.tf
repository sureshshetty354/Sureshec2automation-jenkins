provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {
  ami           = "ami-02b64aa047cb5edf5"   # Replace with your AMI ID
  instance_type = "t3.micro"

  tags = {
    Name = "Terraform-EC2"
  }
}
