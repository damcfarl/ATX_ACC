variable "aci_username" { default = "damcfarl" }
variable "aci_password" { default = "cisco!123" }
variable "aci_url" { default = "https://10.122.143.36" }

variable "vcenter_user" { default = "damcfarl" }
variable "vcenter_password" { default = "cisco!123" }
variable "vcenter_url" { default = "10.122.143.52" }

variable "vmware_credentials" {
  default = "dm_credentials"
}

variable "vmm_domain_tf" {
  default = "dm_vDS"
}

variable "vmm_domain_name" {
  default = "dm_vCenter"
}

variable "vsphere_datacenter" {
  default = "POD05"
}

variable "vsphere_dvs_version" {
  default = "6.6"
}

variable "vmware_aep" {
  default = "dm_AEP"
}

variable "vmm_vlanpool" {
  default = "dm_VLANPool"
}

variable "vsphere_server" {
  default = ""
}

variable "aci_vm1_address" {
  default = "10.5.1.11"
}

variable "aci_vm2_address" {
  default = "10.5.2.11"
}

variable "aci_vm1_name" {
  default = "dm_internal1"
}

variable "aci_vm2_name" {
  default = "external1"
}

variable "gateway" {
    default = "10.5.1.1"
}

variable "domain_name" {
  default = ""
}

variable "vsphere_template" {
  default = "centos-guest-enabled"
}

variable "folder" {
    default = "CLEUR-workshop"
}

variable "dns_list" {
  default = ["172.23.136.143","172.23.136.144"]
}

variable "dns_search" {
  default = ["cisco.com"]
}

variable "vsphere_host_name" {
  default = "10.122.143.52"
}

variable "vsphere_datastore" {
  default = "datastore1"
}
