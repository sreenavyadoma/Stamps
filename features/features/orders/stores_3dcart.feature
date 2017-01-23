
Feature:  3DCart Store Management

  Background:
    Given I am signed in to Orders

    @3dcart
    Scenario: Store Management - 3DCart Store
      Then Manage Stores: Open Modal
      Then Manage Stores: Delete All Stores

      # Add Store
      Then Manage Stores: Add

      Then Marketplace: Select 3dcart

      Then 3DCart Store: Set API User Key to 54442471661986222544424716619862
      Then 3DCart Store: Set URL to your store to http://sandbox-stamps.3dcartstores.com
      Then 3DCart Store: Set Product Weight Units to Pounds
      Then 3DCart Store: Connect

      Then Store Settings: Set Store Nickname to random

      Then Store Settings: Set Automatically Import New Orders to checked
      Then Store Settings: Save
      Then Orders Toolbar: Refresh Orders

      Then Manage Stores: Select Store random

      # Reconnect Store
      Then Manage Stores: Reconnect

      Then 3DCart Store: Set API User Key to 54442471661986222544424716619862
      Then 3DCart Store: Set URL to your store to http://sandbox-stamps.3dcartstores.com
      Then 3DCart Store: Set Product Weight Units to Pounds
      Then 3DCart Store: Reconnect

      # Edit Store
      Then Manage Stores: Select Store random
      Then Manage Stores: Edit

      Then Store Settings: Set Store Nickname to random
      Then Store Settings: Save

      # Delete Store
      Then Manage Stores: Select Store random
      Then Manage Stores: Delete
      Then Orders Toolbar: Refresh Orders

      Then Manage Stores: Close Modal
      Then Sign out




