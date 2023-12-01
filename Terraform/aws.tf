provider "aws" {
  profile = "default"
  access_key = file("${path.module}/aws-cred.txt")
  secret_key = filebase64("${path.module}/aws-cred.txt")
}

resource "aws_instance" "web-server"{
    ami = "ami-0f8d2a6080634ee69"
    instance_type = "t3.micro"
    key_name = "keypair-bahrain"
    subnet_id = "subnet-028e2eb09b7de9c6a"
    associate_public_ip_address = true
    count = 3
    tags = {
        name = "web-server - ${count.index + 1}"
        env = "dev"
    }
}


resource "aws_instance" "mail-server" {
  ami = "ami-0f8d2a6080634ee69"
  instance_type = "t3.micro"
  key_name = "keypair-bahrain"
  subnet_id = "subnet-028e2eb09b7de9c6a"
  vpc_security_group_ids = ["vpc-0da89eaf3a2bcb548"]
  count = 2
  tags = {
    name= "mail-server-${count.index+1}"
    tags= "mai-server"
  }
}
