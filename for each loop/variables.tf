
variable "instances" { 
    default = {
        mysql : "t3.small"
        backend : "t3.micro"
        frontend : "t3.micro"
    }
}

variable "ami" {
    default = "ami-0220d79f3f480ecf5"
    type = string
}

variable "common_tags" {
  default = {
    project = "expense"
    environment = "dev"
  }
}

variable "zone_id" {
  default = "Z00951673I2OYCZYMUOPO"
}

variable "domain_name" {
    default = "manojmantha.online"
}