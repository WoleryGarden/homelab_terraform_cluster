provider "vsphere" {
  user                 = var.vsphere_user
  password             = var.vsphere_password
  vsphere_server       = var.vsphere_server
  allow_unverified_ssl = true
  version              = ">= 1.23"
}

provider "consul" {
  address = var.consul_address
  scheme  = var.consul_scheme
  token   = var.consul_token
}
