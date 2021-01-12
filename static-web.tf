resource "aws_s3_bucket" "static_web"{
    bucket = "static-web"
    acl = "private"
    
}