# Terraform IPv6 ULA Generator

This module makes it easy to generate an IPv6 unique local address (ULA) prefix.  ULA are used for private addressing in IPv6 and are defined by [RFC 4193](https://datatracker.ietf.org/doc/html/rfc4193).  They have a 40-bit random part which makes them unique.


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
