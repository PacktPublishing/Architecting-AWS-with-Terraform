variable "image_id" {
  type    = string
  default = "ami-12345678"
}

resource "aws_instance" "web_server" {
  ami           = var.image_id
  instance_type = "t2.micro"
}

output "public_ip" {
  value = aws_instance.web_server.public_ip
}