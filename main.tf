provider "aws" {
  region = "eu-central-1"
}

data "aws_vpc" "default" {
  default = true
}


resource "aws_security_group" "web_std" {
  name        = "web_std"
  description = "brauchen wir fuer webserver"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "web_std"
  }
}

resource "aws_instance" "websrv" {
  count                  = 2
  ami                    = "ami-0cc0a36f626a4fdf5"
  instance_type          = "t2.micro"
  key_name               = "mhp_aws_dev"
  user_data              = file("web-init.sh")
  vpc_security_group_ids = ["sg-0734769e8ad88ce52", aws_security_group.web_std.id]

  tags = {
    Name  = "web${count.index + 1}"
    Group = "websrv"
  }
}

# resource "null_resource" "rmfile" {
#   provisioner "local-exec" {
#     command = "rm private_ips.txt"
#   }
# }

resource "null_resource" "websrv" {
  count = 2
  provisioner "local-exec" {
    command = "echo ${aws_instance.websrv[count.index].private_ip} web${count.index}.add.sa web${count.index} >> private_ips.txt"
  }
}

# output "default_vpc_id" {
#   value = data.aws_vpc.default.id
# }