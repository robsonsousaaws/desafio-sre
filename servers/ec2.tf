data "aws_ami" "ubuntu" {
	most_recent = true

	filter {
		name = "name"
		values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"] 
	}

	owners = ["099720109477"] #ubuntu oficial
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  count         = var.servers
  instance_type = "t2.micro"
  key_name        = var.instance_key
  subnet_id       = aws_subnet.public_subnet.id
  security_groups = [aws_security_group.sg.id]

  user_data = <<-EOF
  #!/bin/bash
  echo "*** Installing apache2"
  sudo apt update -y
  sudo apt install apache2 -y
  echo "*** Completed Installing apache2"
  EOF

  tags = {
    Name = "WebServer"
  }
  volume_tags = {
    Name = "web_instance"
  } 
}