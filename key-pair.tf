resource "aws_key_pair" "test_key" {
  key_name   = local.key_name
  public_key = file("${path.module}/id_rsa.pub")
}


output "keyname" {
  value = aws_key_pair.test_key.key_name
}
