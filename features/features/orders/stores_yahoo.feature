
Feature:  Yahoo Store Management

  Background:
    Given a valid user is signed in to Web Apps

    @yahoo
    Scenario: Yahoo Store
      Then Manage Stores: Open Modal
      # Delete stores
      Then Manage Stores: Delete All Stores

      # Add Store
      Then Manage Stores: Add

      Then Marketplace: Expect store selection modal contains Yahoo
      Then Marketplace: Select Yahoo

      Then Yahoo Store: Set Yahoo Store ID to yhst-143052023869418
      Then Yahoo Store: Set Partner Store Contract Token to 1.0_DLe5kels_wFcqVu33hTVLwqMAmGWerWagQ2RLZWbffEomPbeqdfCKZigaJ6FXO_3YcnJtQO.NCMVh9lBJY5gW_iE0oaFSipcty3sjnnx8wP6bgxlwIn.brtFnT8hRUY3srmZFIXJZA--
      Then Yahoo Store: Set First Order ID to Import to 637
      Then Yahoo Store: Connect

      Then Store Settings: Set Store Nickname to random

      Then Store Settings: Set Automatically Import New Orders to checked
      Then Store Settings: Save

      Then Manage Stores: Close Modal

      Then in Orders Toolbar, Refresh Orders
      Then in Orders Toolbar, Refresh Orders
      Then check Orders Grid Order ID 637
      Then in Orders Toolbar, Refresh Orders
      Then In left Filter Panel, select Shipped
      Then In left Filter Panel, select Awaiting Shipment
      Then expect Orders Grid Store is random

      Then Manage Stores: Open Modal

      # Reconnect Store
      Then Manage Stores: Select Store random
      Then Manage Stores: Reconnect
      Then Yahoo Store: Set Yahoo Store ID to yhst-143052023869418
      Then Yahoo Store: Set Partner Store Contract Token to 1.0_DLe5kels_wFcqVu33hTVLwqMAmGWerWagQ2RLZWbffEomPbeqdfCKZigaJ6FXO_3YcnJtQO.NCMVh9lBJY5gW_iE0oaFSipcty3sjnnx8wP6bgxlwIn.brtFnT8hRUY3srmZFIXJZA--
      Then Yahoo Store: Set First Order ID to Import to 637
      Then Yahoo Store: Reconnect
      Then Manage Stores: Close Modal

      Then in Orders Toolbar, Refresh Orders
      Then in Orders Toolbar, Refresh Orders
      Then check Orders Grid Order ID 637
      Then in Orders Toolbar, Refresh Orders
      Then In left Filter Panel, select Shipped
      Then In left Filter Panel, select Awaiting Shipment
      Then expect Orders Grid Store is random

      Then Manage Stores: Open Modal

      # Edit Store
      Then Manage Stores: Select Store random
      Then Manage Stores: Edit

      Then Store Settings: Set Store Nickname to random
      Then Store Settings: Save

      Then Manage Stores: Close Modal

      Then in Orders Toolbar, Refresh Orders
      Then in Orders Toolbar, Refresh Orders
      Then check Orders Grid Order ID 637
      Then in Orders Toolbar, Refresh Orders
      Then In left Filter Panel, select Shipped
      Then In left Filter Panel, select Awaiting Shipment
      Then expect Orders Grid Store is random

      Then Manage Stores: Open Modal

      Then Manage Stores: Delete All Stores
      Then Manage Stores: Close Modal
      Then Sign out




