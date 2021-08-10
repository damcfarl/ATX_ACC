terraform {
  required_version = ">=1.0.1"
}

terraform {
  required_providers {
    mso = {
      source = "CiscoDevNet/mso"
      version = "=0.2.0"
    }
  }
}
provider "mso" {
    # cisco-mso user name
    username = "admin"
    # cisco-mso password
    password = "cisco!123456"
    # cisco-mso url
    url      = "https://14.2.172.143/"
    # domain   = "domain-name"
    insecure = true
    platform = "mso"
}

resource "mso_tenant" "tenent_1" {
  name = "tenant_terraform_T01"
  display_name = "tenant_terraform_T01"
  site_associations{site_id = "6099cc3f2f000066028a4ef0"}
  site_associations{site_id = "6099cc582f000081028a4ef1"}
}

/*
resource "mso_schema" "foo_schema" {
  name          = "nkp12"
  template_name = "template1"
  tenant_id     = "5ea000bd2c000058f90a26ab"
}
*/
