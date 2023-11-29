resource "aws_instance" "web-server"{
    ami = "ami-0f8d2a6080634ee69"
    instance_type = "t3.micro"
    tags = {
        name = "test-instance"
        env = "dev"
    }
}