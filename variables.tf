variable "vpn_gateway_id" {
  description = "The id of the VPN Gateway."
  type        = string
  default     = null
}

variable "transit_gateway_id" {
  description = "The ID of the Transit Gateway."
  type        = string
  default     = null
}

variable "customer_gateway_id" {
  description = "The id of the Customer Gateway."
  type        = string
}

variable "create_vpn_connection" {
  description = "Set to false to prevent the creation of a VPN Connection."
  type        = bool
  default     = true
}

variable "vpc_id" {
  description = "The id of the VPC where the VPN Gateway lives."
  type        = string
  default     = null
}

variable "vpc_subnet_route_table_ids" {
  description = "The ids of the VPC subnets for which routes from the VPN Gateway will be propagated."
  type        = list(string)
  default     = []
}

# Workaround for limitation when using computed values in count attribute
# https://github.com/hashicorp/terraform/issues/10857
variable "vpc_subnet_route_table_count" {
  description = "The number of subnet route table ids being passed in via `vpc_subnet_route_table_ids`."
  type        = number
  default     = 0
}

variable "tags" {
  description = "Set of tags to be added to the VPN Connection resource (only if `create_vpn_connection = true`)."
  type        = map(string)
  default     = {}
}

variable "vpn_connection_static_routes_only" {
  description = "Set to true for the created VPN connection to use static routes exclusively (only if `create_vpn_connection = true`). Static routes must be used for devices that don't support BGP."
  type        = bool
  default     = false
}

variable "vpn_connection_static_routes_destinations" {
  description = "List of CIDRs to be used as destination for static routes (used with `vpn_connection_static_routes_only = true`). Routes to destinations set here will be propagated to the routing tables of the subnets defined in `vpc_subnet_route_table_ids`."
  type        = list(string)
  default     = []
}

variable "tunnel1_dpd_timeout_action" {
  description = "The action to take after dead peer detection (DPD) timeout occurs."
  type        = string
  default     = "restart"
}

variable "tunnel2_dpd_timeout_action" {
  description = "The action to take after dead peer detection (DPD) timeout occurs."
  type        = string
  default     = "restart"
}

variable "tunnel1_dpd_timeout_seconds" {
  description = "The number of seconds it takes for a dead peer detection (DPD) timeout to occur"
  type        = number
  default     = 180
}

variable "tunnel2_dpd_timeout_seconds" {
  description = "The number of seconds it takes for a dead peer detection (DPD) timeout to occur"
  type        = number
  default     = 180
}

variable "tunnel1_ike_versions" {
  description = "The Internet Key Exchange (IKE) negotiation process version"
  type        = list(string)
  default     = ["ikev1", "ikev2"]
}

variable "tunnel2_ike_versions" {
  description = "The Internet Key Exchange (IKE) negotiation process version"
  type        = list(string)
  default     = ["ikev1", "ikev2"]
}

variable "tunnel1_phase1_dh_group_numbers" {
  description = "The DH group numbers that are permitted for the VPN tunnel for phase 1 of the IKE negotiations. You can specify one or more of the default values."
  type        = list(number)
  default     = [2, 14, 15, 16, 17, 18, 22, 23, 24]
}

variable "tunnel2_phase1_dh_group_numbers" {
  description = "The DH group numbers that are permitted for the VPN tunnel for phase 1 of the IKE negotiations. You can specify one or more of the default values."
  type        = list(number)
  default     = [2, 14, 15, 16, 17, 18, 22, 23, 24]
}

variable "tunnel1_phase1_encryption_algorithms" {
  description = "The encryption algorithms that are permitted for the VPN tunnel for phase 1 of the IKE negotiations. You can specify one or more of the default values."
  type        = list(string)
  default     = ["AES128", "AES256", "AES128-GCM-16", "AES256-GCM-16"]
}

variable "tunnel2_phase1_encryption_algorithms" {
  description = "The encryption algorithms that are permitted for the VPN tunnel for phase 1 of the IKE negotiations. You can specify one or more of the default values."
  type        = list(string)
  default     = ["AES128", "AES256", "AES128-GCM-16", "AES256-GCM-16"]
}

variable "tunnel1_phase1_integrity_algorithms" {
  description = "The integrity algorithms that are permitted for the VPN tunnel for phase 1 of the IKE negotiations. You can specify one or more of the default values."
  type        = list(string)
  default     = ["SHA-1", "SHA2-256", "SHA2-384", "SHA2-512"]
}

variable "tunnel2_phase1_integrity_algorithms" {
  description = "The integrity algorithms that are permitted for the VPN tunnel for phase 1 of the IKE negotiations. You can specify one or more of the default values."
  type        = list(string)
  default     = ["SHA-1", "SHA2-256", "SHA2-384", "SHA2-512"]
}

variable "tunnel1_phase2_dh_group_numbers" {
  description = "The DH group numbers that are permitted for the VPN tunnel for phase 2 of the IKE negotiations. You can specify one or more of the default values."
  type        = list(number)
  default     = [2, 5, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24]
}

variable "tunnel2_phase2_dh_group_numbers" {
  description = "The DH group numbers that are permitted for the VPN tunnel for phase 2 of the IKE negotiations. You can specify one or more of the default values."
  type        = list(number)
  default     = [2, 5, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24]
}

variable "tunnel1_phase2_encryption_algorithms" {
  description = "The encryption algorithms that are permitted for the VPN tunnel for phase 2 of the IKE negotiations. You can specify one or more of the default values."
  type        = list(string)
  default     = ["AES128", "AES256", "AES128-GCM-16", "AES256-GCM-16"]
}

variable "tunnel2_phase2_encryption_algorithms" {
  description = "The encryption algorithms that are permitted for the VPN tunnel for phase 2 of the IKE negotiations. You can specify one or more of the default values."
  type        = list(string)
  default     = ["AES128", "AES256", "AES128-GCM-16", "AES256-GCM-16"]
}

variable "tunnel1_phase2_integrity_algorithms" {
  description = "The integrity algorithms that are permitted for the VPN tunnel for phase 1 of the IKE negotiations. You can specify one or more of the default values."
  type        = list(string)
  default     = ["SHA1", "SHA2-256", "SHA2-384", "SHA2-512"]
}

variable "tunnel2_phase2_integrity_algorithms" {
  description = "The integrity algorithms that are permitted for the VPN tunnel for phase 1 of the IKE negotiations. You can specify one or more of the default values."
  type        = list(string)
  default     = ["SHA1", "SHA2-256", "SHA2-384", "SHA2-512"]
}

variable "tunnel1_inside_cidr" {
  description = "The CIDR block of the inside IP addresses for the first VPN tunnel."
  type        = string
  default     = ""
}

variable "tunnel2_inside_cidr" {
  description = "The CIDR block of the inside IP addresses for the second VPN tunnel."
  type        = string
  default     = ""
}

variable "tunnel1_preshared_key" {
  description = "The preshared key of the first VPN tunnel."
  type        = string
  default     = ""
}

variable "tunnel2_preshared_key" {
  description = "The preshared key of the second VPN tunnel."
  type        = string
  default     = ""
}

# Attachment can be already managed by the terraform-aws-vpc module by using the enable_vpn_gateway variable
variable "create_vpn_gateway_attachment" {
  description = "Set to false to prevent attachment of the VGW to the VPC"
  type        = bool
  default     = true
}

# Use terraform-aws-transit-gateway module to create TGW required resources and set `connect_to_transit_gateway = true` here
variable "connect_to_transit_gateway" {
  description = "Set to false to disable attachment of the VPN connection route to the VPN connection (TGW uses another resource for that)"
  type        = bool
  default     = false
}
