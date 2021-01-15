resource "aws_instance" "server1" {
  ami = "ami-07efac79022b86107"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.subnet1.id
  associate_public_ip_address = true
  user_data = "${file("userdara.sh")}"
  vpc_security_group_ids = [aws_security_gruop.firewall.id]
  tags = {
    name = "web-server"
  }
}
