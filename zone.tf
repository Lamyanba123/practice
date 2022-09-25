resource "aws_route53_zone" "main" {
  name = "codomation.tk"

  tags = {
    Environment = "testing"
  }
}

resource "aws_route53_record" "test-cname" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "test.codomation.tk"
  type    = "CNAME"
  ttl     = "300"
  records = ["${aws_instance.web.public_ip}"]
}

output "name-servers" {
  description = "List all nameservers"
  value       = ["${aws_route53_zone.main.name_servers}"]
}
