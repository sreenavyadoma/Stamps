
Feature:  Shopify Store Management

  Background:
    Given I am signed in to Orders

    @shopify
    Scenario: Store Management - Shopify Store
      Then Manage Stores: Open Modal
      Then Manage Stores: Delete All Stores in Grid

      # Add Store
      Then Manage Stores: Add

      Then Marketplace: Select Shopify

      # Shopify Modal
      Then Shopify Store: Set Shopify Domain to http://sdcqa.myshopify.com
      Then Shopify Store: Test Connection
      Then Shopify Store: Connect

      Then Store Settings: Set Store Nickname to random

      Then Store Settings: Set Automatically Import New Orders to checked
      Then Store Settings: Save

#      # Reconnect Store
#      Then Pause for 1 second
#      Then Manage Stores: Select Store random
#      Then Manage Stores: Reconnect
#
#      Then Shopify Store: Set Shopify Domain to http://sdcqa.myshopify.com
#      Then Shopify Store: Test Connection
#      Then Shopify Store: Connect
#
#      # Edit Store
#      Then Pause for 1 second
#      Then Manage Stores: Select Store random
#      Then Manage Stores: Edit
#
#      Then Store Settings: Set Store Nickname to random
#      Then Store Settings: Save
#
#      # Delete Store
#      Then Pause for 1 second
#      Then Manage Stores: Select Store random
#      Then Manage Stores: Delete
#      Then Toolbar: Refresh Orders

      Then Manage Stores: Close Modal
      Then Sign out



