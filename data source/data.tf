data "aws_ami" "joindevops" {
  owners           = ["973714476881"]
  most_recent      = true

  filter {
    name   = "name"
    values = ["Redhat-9-DevOps-Practice"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_vpc" "vpd_id" {
    default = true
}

output "ami_info" {
    value = data.aws_ami.joindevops.id
}

output "vpc_id" {
    value = data.aws_vpc.vpd_id.id
}