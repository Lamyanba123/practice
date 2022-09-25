resource "aws_route53_zone" "main" {
  name = local.zone_name

  tags = {
    Environment = "testing"
  }
}

resource "aws_route53_record" "test-cname" {
  zone_id = aws_route53_zone.main.zone_id
  name    = local.record_name
  type    = "CNAME"
  ttl     = "300"
  records = ["${aws_instance.web.public_ip}"]
}

output "name-servers" {
  description = "List all nameservers"
  value       = ["${aws_route53_zone.main.name_servers}"]
}
