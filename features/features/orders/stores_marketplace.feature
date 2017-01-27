
Feature:  Store Management - Marketplace

  Background:
    Given a valid user is signed in to Web Apps

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




