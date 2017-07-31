Feature: Manage Shipping Addresses



  Background:
    Given a valid user is signed in to Web Apps


  @mail_manage_shipping_addresses
  Scenario: Open Manage Shipping Addresses Modal

    Then select Print On Shipping Label - 5x8
    Then on Print form, set Mail From to Manage Shipping Addresses
    Then Mail Shipping Addresses: Close Modal

    Then Sign out