resource "aws_instance" "jenkins" {

  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  subnet_id = aws_subnet.public.id

  vpc_security_group_ids = [
    aws_security_group.automation_sg.id
  ]

  tags = {
    Name = "Jenkins-Server"
  }
}
