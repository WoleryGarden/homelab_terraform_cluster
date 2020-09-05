# Provisioning vSphere VMs for a cluster

This is a module to run terraform from AWX with all the heavy lifting done by [terraform_vsphere_vm_cluster](https://github.com/WoleryGarden/terraform_vsphere_vm_cluster) terraform module. Apart from terraform dependencies versions it also makes a few other assumptions:

* If a customer inventory template is used it should be placed at the terraform root (usually top level of this repo) with the name `ansible_hosts.tpl`
* `locals.tf` configuration for the [terraform_vsphere_vm_cluster](https://github.com/WoleryGarden/terraform_vsphere_vm_cluster) terraform module also should be placed at the top level, along with the rest of `*.tf` files.
* The path to ansible inventory to write is `ansible/${var.cluster_name}/ansible_hosts.ini`

## Input Variables

* vsphere_server
* vsphere_user
* vsphere_password
* consul_token
* consul_address
* consul_scheme
* cluster_name
* has_custom_inventory_template

Most of the variables are self-evident. Consul is used for terraform state storage and also the generated ansible inventory for the provisioned cluster is written there. `has_custom_inventory_template` if false, uses `ansible_hosts.tpl` you provide, if true, the default one, coming with [terraform_vsphere_vm_cluster](https://github.com/WoleryGarden/terraform_vsphere_vm_cluster) terraform module is used.

