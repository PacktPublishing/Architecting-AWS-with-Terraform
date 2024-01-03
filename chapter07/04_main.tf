resource "aws_instance" "web_server" {
  ami           = "ami-12345678"
  instance_type = "t2.micro"
  provisioner "remote-exec" {
    inline = [
      "apt-get update",
      "apt-get install -y nginx",
    ]
  }
}