
@stores
Feature:  All Store Management

  Background:
    Given a valid user is signed in to Web Apps

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
      Then in Orders Toolbar, Refresh Orders

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
      Then in Orders Toolbar, Refresh Orders

      Then Manage Stores: Close Modal
      Then Sign out


  @amazon
  Scenario: Amazon Store
    Then Manage Stores: Open Modal
    Then Manage Stores: Delete All Stores

  # Add Store
    Then Manage Stores: Add

    Then Marketplace: Select Amazon

    Then Amazon Store: Set Amazon Seller ID to A1BX1F0B3I9QDV
    Then Amazon Store: Set Amazon MWS Auth Token to amzn.mws.caa9355f-c8a9-768e-bf55-8b51e73b8f98
    Then Amazon Store: Click Verify Seller ID button
    Then Amazon Store: Set Order Source to Amazon.com
    Then Amazon Store: Set Product Identifier to Use SKU
    Then Amazon Store: Connect for the first time expecting Amazon Settings modal

    Then Store Settings: Set Store Nickname to random

    Then Store Settings: Set Automatically Import New Orders to checked
    Then Store Settings: Save
    Then in Orders Toolbar, Refresh Orders

    Then Manage Stores: Select Store random

  # Reconnect Store
    Then Manage Stores: Reconnect

    Then Amazon Store: Set Amazon Seller ID to A1BX1F0B3I9QDV
    Then Amazon Store: Set Amazon MWS Auth Token to amzn.mws.caa9355f-c8a9-768e-bf55-8b51e73b8f98
    Then Amazon Store: Click Verify Seller ID button
    Then Amazon Store: Set Order Source to Amazon.com
    Then Amazon Store: Set Product Identifier to Use SKU
    Then Amazon Store: Connect

  # Edit Store
    Then Manage Stores: Select Store random
    Then Manage Stores: Edit

    Then Store Settings: Set Store Nickname to random
    Then Store Settings: Save

  # Delete Store
    Then Manage Stores: Select Store random
    Then Manage Stores: Delete
    Then in Orders Toolbar, Refresh Orders

    Then Manage Stores: Close Modal
    Then Sign out


  @big_commerce
  Scenario: Big Commerce Store Management
    Then Manage Stores: Open Modal
    Then Manage Stores: Delete All Stores

    # Add Store
    Then Manage Stores: Add
    Then Marketplace: Select Big Commerce
    Then Big Commerce: Expect Login to your Bigcommerce admin link is present
    Then Marketplace: Close Modal
    Then Manage Stores: Close Modal
    Then Sign out


  @etsy
  Scenario: Store Management - Etsy Store
    Then Manage Stores: Open Modal
    Then Manage Stores: Delete All Stores

    # Add Store
    Then Manage Stores: Add

    Then Marketplace: Select Etsy

    Then Pause for 1 second
    Then Etsy Store: Set Etsy Username to StampsDC
    Then Etsy Store: Find My Shops
    Then Etsy Store: Set Available Shops
    Then Etsy Store: Connect then sign in with Etsy credentials StampsDC/etsydevSTMP1234

    Then Store Settings: Set Store Nickname to random

    Then Store Settings: Set Automatically Import New Orders to checked
    Then Store Settings: Save

    # Reconnect Store
    Then Pause for 1 second
    Then Manage Stores: Select Store random
    Then Manage Stores: Reconnect
    Then Etsy Store: Set Etsy Username to StampsDC
    Then Etsy Store: Find My Shops
    Then Etsy Store: Set Available Shops
    Then Etsy Store: Reconnect then sign in with Etsy credentials StampsDC/etsydevSTMP1234

    # Edit Store
    Then Pause for 1 second
    Then Manage Stores: Select Store random
    Then Manage Stores: Edit

    Then Store Settings: Set Store Nickname to random
    Then Store Settings: Save

    # Delete Store
    Then Pause for 1 second
    Then Manage Stores: Select Store random
    Then Manage Stores: Delete
    Then in Orders Toolbar, Refresh Orders

    Then Manage Stores: Close Modal
    Then Sign out



  @marketplace
  Scenario: Store Management - Marketplace
    Then Manage Stores: Open Modal
    Then Manage Stores: Add

    Then Marketplace: Expect store selection modal contains Rakuten
    Then Marketplace: Expect store selection modal contains 3DCart
    Then Marketplace: Expect store selection modal contains Amazon
    Then Marketplace: Expect store selection modal contains Ebay
    Then Marketplace: Expect store selection modal contains Etsy
    Then Marketplace: Expect store selection modal contains Paypal
    Then Marketplace: Expect store selection modal contains Shopify
    Then Marketplace: Expect store selection modal contains Volusion
    Then Marketplace: Expect store selection modal contains Yahoo
    Then Marketplace: Expect store selection modal contains Bigcommerce

    Then Marketplace: Close Modal
    Then Manage Stores: Close Modal
    Then Sign out


  @paypal
  Scenario: PayPal Store Management
    Then Manage Stores: Open Modal
    Then Manage Stores: Delete All Stores

    # Add Store
    Then Manage Stores: Add
    Then Marketplace: Select PayPal
    Then PayPal: Expect PayPal store modal is present
    Then PayPal: Set PayPal Email Address to qawebclient@stamps.com
    Then PayPal: Test Connection
    Then PayPal Email Verification Required: Expect modal is present
    Then PayPal Email Verification Required: Close modal
    Then PayPal: Close modal
    Then Manage Stores: Close Modal

    Then Manage Stores: Open Modal
    Then Manage Stores: Add
    Then Marketplace: Select PayPal
    Then PayPal: Expect PayPal store modal is present
    Then PayPal: Set PayPal Email Address to qawebclient@stamps.com
    Then PayPal: Test Connection
    Then PayPal Email Verification Required: Expect modal is present

    Then PayPal Email Verification Required: Send Email Verification
    Then PayPal: Expect Email Verification Sent modal is present
    Then PayPal: Expect Verification Email is sent to qawebclient@stamps.com
    Then PayPal: Close modal
    Then Manage Stores: Close Modal
    Then Sign out



  @rakuten
  Scenario: Rakuten Store Management
    Then Manage Stores: Open Modal
    Then Manage Stores: Delete All Stores

    # Add Store
    Then Manage Stores: Add

    Then Marketplace: Expect store selection modal contains Rakuten
    Then Marketplace: Select Rakuten

    Then Rakuten Store: Set Rakuten Seller ID 40549242
    Then Rakuten Store: Set FTP Username batchstore@stamps.com
    Then Rakuten Store: Set FTP Password stampstest225
    Then Rakuten Store: Set Map Rakuten SKU as your Product SKU to checked
    Then Rakuten Store: Set Map Rakuten SKU as your Product SKU to unchecked
    Then Rakuten Store: Set Map Rakuten SKU as your Product SKU to checked

    Then Rakuten Store: Connect

    Then Store Settings: Set Store Nickname to random

    Then Store Settings: Set Automatically Import New Orders to checked
    Then Store Settings: Save
    Then in Orders Toolbar, Refresh Orders

    Then Manage Stores: Select Store random

    # Reconnect Store
    Then Manage Stores: Reconnect

    Then Rakuten Store: Set Rakuten Seller ID 40549242
    Then Rakuten Store: Set FTP Username batchstore@stamps.com
    Then Rakuten Store: Set FTP Password stampstest225
    Then Rakuten Store: Set Map Rakuten SKU as your Product SKU to checked
    Then Rakuten Store: Set Map Rakuten SKU as your Product SKU to unchecked
    Then Rakuten Store: Set Map Rakuten SKU as your Product SKU to checked

    Then Rakuten Store: Connect

    Then Store Settings: Set Store Nickname to random

    Then Store Settings: Set Automatically Import New Orders to checked
    Then Store Settings: Save
    Then in Orders Toolbar, Refresh Orders

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

    Then Manage Stores: Close Modal
    Then Sign out



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



  @volusion
  Scenario: Store Management - Volusion Store
    Then Manage Stores: Open Modal
    Then Manage Stores: Delete All Stores

    # Add Store
    Then Manage Stores: Add

    Then Marketplace: Select Volusion

    Then Volusion Store: Set Volusion API to http://ywvmt.dmjeb.servertrust.com/net/WebService.aspx?Login=qaclient@stamps.com&EncryptedPassword=39E8EDED1C795511ACF981DD59FF8398399965CD1A6D3F8069EEF60A096282E2&EDI_Name=Generic\Orders

    Then Volusion Store: Connect

    Then Store Settings: Set Store Nickname to random
    Then Store Settings: Set Automatically Import New Orders to checked
    Then Store Settings: Save

    Then in Orders Toolbar, Refresh Orders
    Then Manage Stores: Select Store random

    # Reconnect Store
    Then Manage Stores: Reconnect

    Then Volusion Store: Set Volusion API to http://ywvmt.dmjeb.servertrust.com/net/WebService.aspx?Login=qaclient@stamps.com&EncryptedPassword=39E8EDED1C795511ACF981DD59FF8398399965CD1A6D3F8069EEF60A096282E2&EDI_Name=Generic\Orders

    Then Volusion Store: Reconnect

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
    Then Pause for 1 second
    Then Sign out

      #Then Store Settings: Set service Mapping 1, Requested Services random, Shipping service First-Class Mail Postcard
      #Then Store Settings: Set service Mapping 2, Requested Services random, Shipping service Priority Mail Package
      #Then Store Settings: Set service Mapping 3, Requested Services random, Shipping service Priority Mail Small Flat Rate Box



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
    Then check orders grid cached order id 637
    Then in Orders Toolbar, Refresh Orders
    Then select Filter Panel tab Shipped
    Then select Filter Panel tab Awaiting Shipment
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
    Then check orders grid cached order id 637
    Then in Orders Toolbar, Refresh Orders
    Then select Filter Panel tab Shipped
    Then select Filter Panel tab Awaiting Shipment
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
    Then check orders grid cached order id 637
    Then in Orders Toolbar, Refresh Orders
    Then select Filter Panel tab Shipped
    Then select Filter Panel tab Awaiting Shipment
    Then expect Orders Grid Store is random

    Then Manage Stores: Open Modal

    Then Manage Stores: Delete All Stores
    Then Manage Stores: Close Modal
    Then Sign out
