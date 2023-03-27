output "vcn_state" {
  description = "The state of the VCN."
  value       = oci_core_vcn.internal.state
}

output "vcn_cidr" {
  description = "CIDR block of the core VCN"
  value       = oci_core_vcn.internal.cidr_block
}

# You can use terraform graph to visualize your execution plan
# https://techpress.net/how-to-show-terraform-configuration-in-visual-graphical-representaton-using-graphviz/

# Run the following to get a graph
# terraform graph > mygrah.dot -> Save file as UTF-8
# https://forum.graphviz.org/t/syntax-error-in-line-1/1236/4
# dot -Tsvg graph.dot -o mygraph1.svg