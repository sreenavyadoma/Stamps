Feature: Manage Shipping Addresses



  Background:
    Given I am signed in as Mail shipper


  @mail_manage_shipping_addresses
  Scenario: Open Manage Shipping Addresses Modal

    Then Mail: Select Shipping Label - 5 ½” x 8 ½”
    Then Mail: Set Mail From to Manage Shipping Addresses
    Then Mail Shipping Addresses: Close Modal

    Then Sign out