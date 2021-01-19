resource "aws_instance" "ordersvc_instance" {
  ami = "ami-0e67aff698cb24c1d"   # ubuntu 18.04 EC2 instance
  instance_type = "t3.micro"
  key_name = aws_key_pair.ordersvc_admin.key_name
  vpc_security_group_ids = [
    aws_security_group.ordersvc_ssh.id,
    data.aws_security_group.default.id
  ]
}

