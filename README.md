azurerm-subnet
==============

Terraform [Azure Virtual Network Subnet](https://learn.microsoft.com/en-us/azure/virtual-network/subnet-extension).

If `var.address_prefixes` is:

* **set** - create resource
* **not set** - read existing resource data

Required providers
------------------

* [hashicorp/azurerm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)

Variables
--------------

* `variables.tf`
  * `separator`: Single character to separate segments in object's name.
  * `name`: The name of the subnet. Generated from tags if not set.
  * `tags_keys`: The list of tags keys.
  * `tags_keys`: The list of tags values.
  * `names_keys`: The list of names keys to be used for name generation.
* `subnet.vars.tf`
  * `resource_group_name`: The name of the resource group in which to create the subnet.
  * `virtual_network_name`: The name of the virtual network to which to attach the subnet.
  * **`address_prefixes`**: The list of address prefixes used by the subnet.

Outputs
--------------

* `data`: Subnet data.

Dependencies
------------

*No* *dependencies*

Examples
--------

* `main.tf`

  ```terraform
  module "azurerm_subnet" {
    sources = "github.com/mario-slowinski/terraform-azurerm-subnet"
  }
  ```

License
-------

[GPL-3.0](https://www.gnu.org/licenses/gpl-3.0.html)

Author Information
------------------

[mario.slowinski@gmail.com](mailto:mario.slowinski@gmail.com)
