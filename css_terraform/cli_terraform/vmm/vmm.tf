terraform {
  required_version = ">= 1.0.1"
}

terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = "=0.7.1"
    }
  }
}

provider "aci" {
  username = var.aci_username
  password = var.aci_password
  url      = var.aci_url
# insecure = true
}

resource "aci_rest" "rest_aci_1vmm_domain_create" {
  path = "/api/node/mo/uni/vmmp-VMware/dom-${var.vmm_domain_tf}.json"
  class_name = "vmmDomP"
  content = {
    "name" = "${var.vmm_domain_tf}"
    }
}

resource "aci_rest" "rest_aci_2vmm_vcenter_loginpass" {
  path       = "/api/node/mo/uni/vmmp-VMware/dom-${var.vmm_domain_tf}/usracc-${var.vmware_credentials}.json"
  class_name = "vmmUsrAccP"
  content = {
    "name"         = "${var.vmware_credentials}"
    "usr"          = "${var.vcenter_user}"
    "pwd"          = "${var.vcenter_password}"
    }
  depends_on = [
    aci_rest.rest_aci_1vmm_domain_create,
  ]
 }

resource "aci_rest" "rest_aci_3vmm_vcenter_vlan" {
  path       = "/api/node/mo/uni/vmmp-VMware/dom-${var.vmm_domain_tf}/rsvlanNs.json"
  class_name = "infraRsVlanNs"
  content = {
    "tDn"          = "uni/infra/vlanns-${var.vmm_vlanpool}-dynamic"
    }
  depends_on = [
    aci_rest.rest_aci_1vmm_domain_create,
  ]
 }

resource "aci_rest" "rest_aci_4vmm_aep" {
  path       = "/api/node/mo/uni/infra/attentp-${var.vmware_aep}.json"
  class_name = "infraRsDomP"
  content = {
    "tDn"          = "uni/vmmp-VMware/dom-${var.vmm_domain_tf}"
    }
  depends_on = [
    aci_rest.rest_aci_1vmm_domain_create,
  ]
 }

resource "aci_rest" "rest_aci_5vmm_vcenter_create" {
  path       = "/api/node/mo/uni/vmmp-VMware/dom-${var.vmm_domain_tf}/ctrlr-${var.vmm_domain_name}.json"
  class_name = "vmmCtrlrP"
  content = {
    "name"         = "${var.vmm_domain_name}"
    "hostOrIp"     = "${var.vcenter_url}"
    "dvsVersion"   = "${var.vsphere_dvs_version}"
    "rootContName" = "${var.vsphere_datacenter}"
    }
  depends_on = [
    aci_rest.rest_aci_1vmm_domain_create,
  ]
 }
resource "aci_rest" "rest_aci_6vmm_vcenter_credentials_apply" {
  path       = "/api/node/mo/uni/vmmp-VMware/dom-${var.vmm_domain_tf}/ctrlr-${var.vmm_domain_name}.json"
  class_name = "vmmRsAcc"
  content = {
    "tDn"          ="uni/vmmp-VMware/dom-${var.vmm_domain_tf}/usracc-${var.vmware_credentials}"
    }
  depends_on = [
    aci_rest.rest_aci_5vmm_vcenter_create,
  ]
 }

