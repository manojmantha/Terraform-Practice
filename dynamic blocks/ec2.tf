
resource "aws_instance" "this" {
    ami = "ami-0220d79f3f480ecf5"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.allow_tls.id]
    tags = {
      Name = "terraform-demo"
    }
}


resource "aws_security_group" "allow_tls" {
    name = "allow_tls"
    description = "Allow TLS inbound traffic and all outbound traffic"

    dynamic "ingress" {
      for_each = var.ingress
      content {
        from_port = ingress.value["from_port"]
        to_port = ingress.value["to_port"]
        cidr_blocks = ingress.value["cidr_blocks"]
        protocol = ingress.value["protocol"]
      }
    }
    

    egress {
        from_port = 0
        to_port = 0
        cidr_blocks = ["0.0.0.0/0"]
        protocol = "-1"
    }

    tags = {
      Name = "Allow_TLS"
    }
}
