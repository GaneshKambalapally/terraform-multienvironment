resource "aws_route53_record" "expense" {
    for_each = aws_instance.foreachdemo
  zone_id = "Z09901269SF0OMZ8IFG8"
  name    = startswith(each.key,"frontend") ? var.domain : "${each.key}.${var.domain}"
  type    = "A"
  ttl     = 1
  records = startswith(each.key,"frontend") ? [each.value.public_ip] : [each.value.private_ip]
}