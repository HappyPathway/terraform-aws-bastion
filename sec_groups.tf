resource "aws_security_group" "bastion" {
  name   = "${var.network_name}-${var.public_subnet_id}-bastion"
  vpc_id = "${var.vpc_id}"

  # ingress {
  #   from_port   = 22
  #   to_port     = 22
  #   protocol    = "tcp"
  #   cidr_blocks = ["${var.ssh_access}"]
  # }

  # egress {
  #   from_port   = 0
  #   to_port     = 0
  #   protocol    = "-1"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }

  lifecycle {
    create_before_destroy = true
  }

  tags = "${var.resource_tags}"
}

resource "aws_security_group_rule" "bastion_ssh" {
  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = [var.ssh_access]
  # ipv6_cidr_blocks  = [aws_vpc.example.ipv6_cidr_block]
  security_group_id = aws_security_group.bastion.subnet_id
}