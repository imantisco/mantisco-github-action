# 이 코드는 보안 취약점을 노출하기 위한 코드입니다.
resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

output "public_key" {
  value = tls_private_key.example.public_key_openssh
}

output "private_key_pem" {
  value     = tls_private_key.example.private_key_pem
}