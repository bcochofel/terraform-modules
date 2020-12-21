package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/azure"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestAzureNetworkExample(t *testing.T) {
	t.Parallel()

	// subscriptionID is overridden by the environment variable "ARM_SUBSCRIPTION_ID"
	subscriptionID := ""

	// terraform values to test
	rgName := "rg-base-example-001"
	vNetName := "vnet-base-example-001"

	// Configure Terraform setting up a path to Terraform code.
	terraformOptions := &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "../examples/azurerm_network",
	}

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// Run `terraform init` and `terraform apply`. Fail the test if there are any errors.
	terraform.InitAndApply(t, terraformOptions)

	// Run `terraform output` to get the values of output variables
	expectedRgName := terraform.Output(t, terraformOptions, "resource_group_name")
	expectedVNetName := terraform.Output(t, terraformOptions, "virtual_network_name")

	// Test for resource name
	t.Run("CheckNames", func(t *testing.T) {
		// Check the Resource Group name
		assert.Equal(t, rgName, expectedRgName)

		// Check the Virtual Network name
		assert.Equal(t, vNetName, expectedVNetName)
	})

	// Test for resource presence
	t.Run("Exists", func(t *testing.T) {
		// Check the Resource Group exists
		assert.True(t, azure.ResourceGroupExists(t, expectedRgName, subscriptionID))

		// Check the Virtual Network exists
		assert.True(t, azure.VirtualNetworkExists(t, expectedVNetName, expectedRgName, subscriptionID))
	})

}
