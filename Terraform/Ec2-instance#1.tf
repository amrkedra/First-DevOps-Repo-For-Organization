

resource "aws_instance" "web-server"{
    ami = "ami-0f8d2a6080634ee69"
    instance_type = "t3.micro"
    key_name = "keypair-bahrain"
    subnet_id = "subnet-028e2eb09b7de9c6a"
    associate_public_ip_address = true
    tags = {
        name = "test-instance"
        env = "dev"
    }
}



