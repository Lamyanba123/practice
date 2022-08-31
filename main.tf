provider "aws" {
 	region = "ap-south-1"
	access_key = var.access_key
	secret_key = var.secret_key 
}


resource "aws_key_pair" "test_key" {
  key_name   = "test-key"
  public_key = file("${path.module}/id_rsa.pub")
}


output "keyname" {
	value = "${aws_key_pair.test_key.key_pair_id}"
}
