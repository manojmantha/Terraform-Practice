
resource "aws_instance" "this" {
  for_each = var.instances
    ami = var.ami
    instance_type = each.value
    vpc_security_group_ids = [aws_security_group.allow_tls.id]
    tags = merge(
      var.common_tags,
      {
        Name = each.key
      }
    )
    
}


resource "aws_security_group" "allow_tls" {
    name = "allow_tls"
    description = "Allow TLS inbound traffic and all outbound traffic"

    ingress{
        from_port = 22
        to_port = 22
        cidr_blocks = ["0.0.0.0/0"]
        protocol = "tcp"
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
