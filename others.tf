resource "aws_elb" "elb_1" {
  name = "elb-1"
  availability_zones = ["us-east-2a"]

  listener{
      instances_port = 80
      
  }
}

