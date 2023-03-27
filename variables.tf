# Variable documentation https://developer.hashicorp.com/terraform/language/values/variables
variable "compartment_id" {
  default  = "ocid1.tenancy.oc1..aaaaaaaaaekpqolgdgahlpiasvswusm2gpyrgxy6hlxv6bxrnapwfwchlnfa"
  description = "Altons Compartment ID"
  type        = string
}
variable "region" {
  description = "region where you have OCI tenancy"
  type        = string
  default     = "ap-mumbai-1"
}
