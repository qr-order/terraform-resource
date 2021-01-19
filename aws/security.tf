resource "aws_key_pair" "ordersvc_admin" {
  key_name = "ordersvc_admin"
  public_key = file("~/.ssh/ordersvc.pub")
}

resource "aws_security_group" "ordersvc_ssh" {
  name = "allow_ssh_from_all"
  description = "Allow SSH port from all"
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

data "aws_security_group" "default" {
  name = "default"
}