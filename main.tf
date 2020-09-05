module "nodes" {
  source      = "github.com/WoleryGarden/terraform_vsphere_vm_cluster"
  vm_defaults = local.vm_defaults
  vm_list     = local.vm_list
  inventory_template_path =  var.has_custom_inventory_template ? "${path.root}/ansible_hosts.tpl" : null
  create_vm_folder = true
}

resource "consul_keys" "ansible_hosts" {
  key {
    path   = "ansible/${var.cluster_name}/ansible_hosts.ini"
    value  = module.nodes.inventory
    delete = true
  }
}
