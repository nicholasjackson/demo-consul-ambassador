resource "tls_private_key" "vms" {
  algorithm   = "RSA"
  rsa_bits = "4096"
}
