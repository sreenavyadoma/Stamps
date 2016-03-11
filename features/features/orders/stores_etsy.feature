
Feature:  Amazon Store Management

  Background:
    Given I am signed in to Orders

    @etsy
    Scenario: Store Management - Amazon Store
      Then Manage Stores: Open Modal
      Then Manage Stores: Delete All Stores in Grid

      # Add Store
      Then Manage Stores: Add

      Then Marketplace: Select Etsy

      # Etsy store modal functions here
      Then Pause for 2 seconds
      Then Etsy Store: Set Etsy Username to StampsDC
      Then Etsy Store: Find My Shops
      Then Etsy Store: Set Available Shops
      Then Etsy Store: Connect then sign in with Etsy credentials StampsDC/etsydevSTMP1234

      Then Store Settings: Set Store Nickname to random

      Then Store Settings: Set Automatically Import New Orders to checked
      Then Store Settings: Save

      # Reconnect Store
      Then Pause for 2 seconds
      Then Manage Stores: Select Store random
      Then Manage Stores: Reconnect
      Then Etsy Store: Set Etsy Username to StampsDC
      Then Etsy Store: Find My Shops
      Then Etsy Store: Set Available Shops
      Then Etsy Store: Connect then sign in with Etsy credentials StampsDC/etsydevSTMP1234

      # Edit Store
      Then Pause for 2 seconds
      Then Manage Stores: Select Store random
      Then Manage Stores: Edit

      Then Store Settings: Set Store Nickname to random
      Then Store Settings: Save

      # Delete Store
      Then Pause for 2 seconds
      Then Manage Stores: Select Store random
      Then Manage Stores: Delete
      Then Toolbar: Refresh Orders

      Then Manage Stores: Close Modal
      Then Sign out



