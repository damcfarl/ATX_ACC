# aci_tenant.tenant_tf:
resource "aci_tenant" "tenant_tf" {
    annotation                  = "orchestrator:terraform"
    id                          = "uni/tn-dm_terraform_tenant_vrf_only"
    name                        = "dm_terraform_tenant_vrf_only"
    relation_fv_rs_tn_deny_rule = []
}

