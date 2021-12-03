output "bastion_host" {
  description = "Public IP Address of the Bastion Host"
  value       = "${aws_instance.bastion.public_ip}"
}

output "bastion_sec_group" {
  description = "Security Group of the Bastion Host"
  value       = "${aws_security_group.bastion.id}"
}

output "key_name" {
  value       = "${var.key_name}"
  description = "Name of KeyPair"
}
