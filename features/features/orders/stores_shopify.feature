
Feature:  Shopify Store Management

  Background:
    Given a valid user is signed in to Web Apps

    @shopify
    Scenario: Store Management - Shopify Store
      Then Manage Stores: Open Modal
      Then Manage Stores: Delete All Stores

      # Add Store
      Then Manage Stores: Add

      Then Marketplace: Select Shopify

      # Shopify Modal
      Then Shopify Store: Set Shopify Domain to http://sdcqa.myshopify.com
      
      Then Shopify Store: Connect using Email qaclient@stamps.com and password Postage1

      Then Store Settings: Set Store Nickname to random

      Then Store Settings: Set Automatically Import New Orders to checked
      Then Store Settings: Save

      Then in Orders Toolbar, Refresh Orders

      # Reconnect Store
      Then Manage Stores: Select Store random
      Then Manage Stores: Reconnect
      Then Shopify Store: Set Shopify Domain to http://sdcqa.myshopify.com
      
      Then Shopify Store: Reconnect

      # Edit Store
      Then Manage Stores: Select Store random
      Then Manage Stores: Edit

      Then Store Settings: Set Store Nickname to random

      Then Store Settings: Set Automatically Import New Orders to checked
      Then Store Settings: Save
      Then in Orders Toolbar, Refresh Orders

      # Delete Store
      Then Manage Stores: Select Store random
      Then Manage Stores: Delete
      Then in Orders Toolbar, Refresh Orders

      # Delete All Stores
      Then Manage Stores: Delete All Stores

      Then Manage Stores: Close Modal
      Then Sign out




