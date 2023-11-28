data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "instance" {
count= var.create_ec2 ? var.counter : 0
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  vpc_security_group_ids = [var.sg]
  user_data = file("./modules/ec2/userdata.tpl")
  tags = {
    Name = "CLOD1000 Project EC2-NGINX"
    project="CLOD1000 Project EC2-NGINX"
    owner="Supriya"
  }
  
}  

