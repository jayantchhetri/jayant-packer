resource "aws_instance" "ec2" {
  ami           = data.aws_ami.packer_image.id
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.mysg.id]
  key_name = "jayantind-kp"
  tags = {
    Name = "NGINX-server"
  }
}


data "aws_ami" "packer_image" {
  most_recent = true

  filter {
    name   = "name"
    values = ["my-second-packer-ami"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["218841850113"] # Canonical
}