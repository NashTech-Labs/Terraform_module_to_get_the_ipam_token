# Terraform_module_to_get_the_ipam_token


This Terraform Git repo contains a module that create an IPAM reservation and vnet in Azure. 

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) - v1.0.5 or later
- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) - v2.26.0 or later

You will also need to have an Azure subscription. 

## Usage

To use this Terraform module, follow these steps:

From your local, generate and Set up SSH key pair for Github.

Clone this Git repo to your local machine.

```bash
git clone git@github.com:NashTech-Labs/Terraform_module_to_get_the_ipam_token.git
```

Change into the directory containing the module.

```bash
cd Terraform_module_to_get_the_ipam_token
```

Initialize Terraform 

```bash
terraform init
```

Create a new file named `azure.tfvars` in the same directory as your `.tf` files.

```bash
touch azure.tfvars
```

Open the file in your preferred text editor.

```bash
nano azure.tfvars
```

Add your desired inputs to the file in the following format:

```ruby
space = "demo"
block = "demo"
size = 16
reservation_description = "demo reservation"
name = "test-vnet"
location = "westus"

```

> Note that the `azure.tfvars` file will not be committed to version control, as it could contain sensitive information such as access keys and credentials.

Review the changes that Terraform will make to your Azure resources.

```bash
terraform plan 
```

Apply the changes 

```bash
terraform apply
```

You can modify this input by editing the `azure.tfvars` file.
