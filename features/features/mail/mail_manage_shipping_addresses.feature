Feature: Manage Shipping Addresses



  Background:
    Given I am signed in as a postage shipper


  @wp_manage_shipping_addresses
  Scenario: Open Manage Shipping Addresses Modal

    Then Mail: Select Shipping Label 5 x 8
    Then Mail: Set Ship-From to Manage Shipping Addresses
    Then Mail Shipping Addresses: Close Modal

    Then Sign out