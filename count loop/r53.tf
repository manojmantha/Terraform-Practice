resource "aws_route53_record" "expense" {
    count = length(var.instances)
  zone_id = var.zone_id
  name    = var.instances[count.index] == "frontend" ? var.domain_name : "${var.instances[count.index]}.${var.domain_name}"
  type    = "A"
  ttl     = 1
  records = [var.instances[count.index] == "frontend" ? aws_instance.this[count.index].public_ip : aws_instance.this[count.index].private_ip]
}