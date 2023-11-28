output "aws_security_group" {
 value = "${aws_security_group.nginx_ec2.id}"
}