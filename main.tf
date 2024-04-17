data "aws_ami" "app_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["bitnami-tomcat-*-x86_64-hvm-ebs-nami"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["979382823631"] # Bitnami
}

data "aws_vpc" "my-enablement-vpc" {
  id = "vpc-06d8628a811699855"
}

data "aws_subnet" "enablement-sub1-private" {
  id = "subnet-0c9b42badfe0ab24e"
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.app_ami.id
  count = length(var.instance_names)
  instance_type = var.instance_types["worker"]
  subnet_id = data.aws_subnet.enablement-sub1-private.id

  tags = {
    Name = var.instance_names[count.index]
  }
}
