# Data from terraform.tfvars file

variable "tenancy_ocid" {}
variable "compartment_ocid" {}
variable "ssh_public_key" {}

# Choose an Availability Domain to deploy your resources
variable "AD" {
    default = "3"
}