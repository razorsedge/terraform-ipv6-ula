# Terraform IPv6 ULA Generator

This module makes it easy to generate an IPv6 unique local address (ULA) prefix.  ULA are used for private addressing in IPv6 and are defined by [RFC 4193](https://datatracker.ietf.org/doc/html/rfc4193).  They have a 40-bit random part which makes them unique.  This prefix will remain stable until the Terraform environment is destroyed.

## Usage

```hcl
module "ula" {
  source = "github.com/razorsedge/terraform-ipv6-ula"
}

resource "azurerm_resource_group" "this" {
  name     = "resource-group"
  location = "eastus"
}

resource "azurerm_virtual_network" "this" {
  name                = "network"
  address_space       = [module.ula.random_ula_network]
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
}
```

The value of `module.ula.random_ula_network` would be something like `fda5:9f91:78b1::/48`.  The value would be different on each Terraform instantiation but would remain stable until tainted or destroyed.  The subnet will always be a /48.

You can use [cidrsubnet](https://developer.hashicorp.com/terraform/language/functions/cidrsubnet) to make a smaller subnet from the base ULA.

```hcl
resource "random_id" "subnet" {
  byte_length = 2
}

locals {
  # Creates a randomly generated /64 subnet from the /48 ULA prefix.
  ula_prefix_subnet = cidrsubnet(module.ula.random_ula_network, 16, random_id.subnet.hex)
}

output "subnet" {
  value = local.ula_prefix_subnet
}
```


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 2.2.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_random"></a> [random](#provider\_random) | 3.7.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [random_id.ula](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_random_ula_network"></a> [random\_ula\_network](#output\_random\_ula\_network) | Randomly generated IPv6 ULA network prefix. |
<!-- END_TF_DOCS -->
