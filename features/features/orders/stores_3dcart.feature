
Feature:  3dcart Store Management

  Background:
    Given I am signed in to Orders

    @3dcart
    Scenario: Store Management - 3dcart Store
      Then Manage Stores: Open Modal
      Then Manage Stores: Delete All Stores in Grid

      # Add Store
      Then Manage Stores: Add

      Then Marketplace: Select 3dcart

      Then 3dcart Store: Set API User Key to 54442471661986222544424716619862
      Then 3dcart Store: Set URL to your store to http://sandbox-stamps.3dcartstores.com
      Then 3dcart Store: Set Product Weight Units to Pounds
      Then 3dcart Store: Test Connection
      Then 3dcart Store: Connect

      Then Store Settings: Set Store Nickname to random

      Then Store Settings: Set Automatically Import New Orders to checked
      Then Store Settings: Save
      Then Toolbar: Refresh Orders

      Then Manage Stores: Select Store random

      # Reconnect Store
      Then Manage Stores: Reconnect

      Then 3dcart Store: Set API User Key to 54442471661986222544424716619862
      Then 3dcart Store: Set URL to your store to http://sandbox-stamps.3dcartstores.com
      Then 3dcart Store: Set Product Weight Units to Pounds
      Then 3dcart Store: Test Connection
      Then 3dcart Store: Reconnect

      # Edit Store
      Then Manage Stores: Select Store random
      Then Manage Stores: Edit

      Then Store Settings: Set Store Nickname to random
      Then Store Settings: Save

      # Delete Store
      Then Manage Stores: Select Store random
      Then Manage Stores: Delete
      Then Toolbar: Refresh Orders

      Then Manage Stores: Close Modal
      Then Sign out




