
Feature:  Volusion Store Management

  Background:
    Given I am signed in to Orders

    @volusion_store
    Scenario: Store Management - Volusion Store
      Then Manage Stores: Open Modal
      Then Manage Stores: Delete All Stores in Grid
      Then Pause for 2 seconds

      Then Manage Stores: Add

      Then Marketplace: Select Volusion

      Then Volusion Store: Set Volusion API URL

      Then Volusion Store: Test Connection

      Then Volusion Store: Connect

      Then Store Settings: Set Store Nickname to random
      Then Store Settings: Check Automatically Import New Orders
      Then Store Settings: Save

      Then Pause for 1 seconds
      Then Toolbar: Refresh Orders

      Then Manage Stores: Select Store random
      Then Manage Stores: Delete
      Then Toolbar: Refresh Orders

      Then Manage Stores: Close Modal
      Then Pause for 1 seconds
      Then Sign out



