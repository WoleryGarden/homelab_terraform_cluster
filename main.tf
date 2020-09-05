module "nodes" {
  source      = "github.com/AndrewSav/terraform_vsphere_vm_cluster"
  vm_defaults = local.vm_defaults
  vm_list     = local.vm_list
}

resource "consul_keys" "ansible_hosts" {
  key {
    path   = "ansible/${var.cluster_name}/ansible_hosts.ini"
    value  = module.nodes.inventory
    delete = true
  }
}
