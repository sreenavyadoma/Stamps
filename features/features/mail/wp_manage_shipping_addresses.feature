Feature: Manage Shipping Addresses



  Background:
    Given I am signed in as a postage shipper


  @wp_manage_shipping_addresses
  Scenario: Open Manage Shipping Addresses Modal

    Then Postage: Select Shipping Label 5 x 8
    Then Postage: Set Ship-From to Manage Shipping Addresses
    Then Postage Shipping Addresses: Close Modal

    Then Sign out