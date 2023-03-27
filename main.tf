# block contains Terraform settings
# refer the following link for providers https://registry.terraform.io/
# The version attribute is optional, but it is recommended using it to constrain the 
# provider version so that Terraform does not install a version of the provider that does not work with your configuration. 
# Use the following documentation for terraform https://docs.oracle.com/en-us/iaas/Content/API/SDKDocs/terraform.htm
# Tutorial documentation - https://developer.hashicorp.com/terraform/tutorials/oci-get-started/oci-build
# Best Practices Guide - https://www.terraform-best-practices.com/code-structure
terraform {
  required_providers {
    oci = {
      source = "hashicorp/oci"
    }
  }
}
# The provider block configures the specified provider, in this case oci. 
# A provider is a plugin that Terraform uses to create and manage your resources.
# The config_file_profile attribute in the OCI provider block refers 
# Terraform to the token credentials stored in the file that the OCI CLI created when 
# you configured it. Never hard-code credentials or other secrets in your configuration files.
provider "oci" {
  region              = var.region
  auth                = "SecurityToken"
  config_file_profile = "learn-terraform"
}
# Use resource blocks to define components of your infrastructure. 
# A resource might be a physical or virtual component such as a VCN, or it can be a logical resource such as a Heroku application.
# In this example,  the resource type is oci_core_vcn and the name is internal.
resource "oci_core_vcn" "internal" {
  dns_label      = "internal"
  cidr_block     = "172.16.0.0/20"
  compartment_id = var.compartment_id
  display_name   = "My internal VCN"
}


# To run this file:

# Step 1 : Initialize Terraform - terraform init
# Step 2 : Ensure your files are well formatted - terrform fmt
# Step 3 : Creating Infrastructure - terraform apply - After this step a terraform state file is created.

# Manually Managing State
# Run "terraform state list"

# Addition of resources to demonstrate how terraform is able to create a plan to get to a desired state so we added the below resource
# just to show that

resource "oci_core_subnet" "dev" {
  vcn_id                      = oci_core_vcn.internal.id
  cidr_block                  = "172.16.0.0/24"
  compartment_id              = var.compartment_id
  display_name                = "Dev subnet 1"
  prohibit_public_ip_on_vnic  = true
  dns_label                   = "dev"
}

# Destroying our resources 

# Run terraform destroy

# Its better to organise variables like the compartment Id in separate files 


# OCI terraform topology https://docs.oracle.com/en/solutions/setup-infra-saas-singletenant/provision-resources1.html#GUID-879EC762-C0CF-4BAE-9F88-CD85275123EC


