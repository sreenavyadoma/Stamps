
Feature:  Amazon Store Management

  Background:
    Given I am signed in to Orders

    @amazon
    Scenario: Store Management - Amazon Store
      Then Manage Stores: Open Modal
      Then Manage Stores: Delete All Stores in Grid

      # Add Store
      Then Manage Stores: Add

      Then Marketplace: Select Etsy

      # Etsy store modal functions here

      Then Store Settings: Set Store Nickname to random

      Then Store Settings: Check Automatically Import New Orders
      Then Store Settings: Save
      Then Toolbar: Refresh Orders

      Then Manage Stores: Select Store random

      # Reconnect Store
      Then Manage Stores: Reconnect

      # Etsy store modal functions here

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



