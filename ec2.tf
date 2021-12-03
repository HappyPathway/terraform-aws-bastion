data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "bastion" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id     = var.public_subnet_id

  security_groups = [
    aws_security_group.bastion.id,
    var.admin_sg,
  ]

  lifecycle {
    ignore_changes = [
      "security_groups"
    ]
  }

  key_name             = var.key_name
  iam_instance_profile = aws_iam_instance_profile.bastion_ro.name
  tags                 = merge({ "network" = var.network_name, "Name" = "${var.network_name}-bastion" }, var.resource_tags)
}
