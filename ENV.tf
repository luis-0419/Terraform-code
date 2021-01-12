provider "aws" {
    region = "us-east-2"
    //access_key 
    //secret_key  
}

resource "aws_vpc"  "vpc1"{
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true

    tags = {
        Name = "vpc 1"
    }
}

resource "aws_subnet" "subnet1"{
    vpc_id = aws_vpc.vpc1.id
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = true
    tags = {
        Name = "subnet1"
    }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc1.id
  
  tags = {
    Name = "igw"
  }
}

resource "aws_route_table" "r"{
    vpc_id = aws_vpc.vpc1.id
    route{
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
    tags = {
        Name = "RT1"
    }
}

resource "aws_route_table_association" "R1"{
    subnet_id = aws_subnet.subnet1.id
    route_table_id = aws_route_table.r.id
}

