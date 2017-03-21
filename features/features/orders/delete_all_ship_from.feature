
Feature:  Delete Ship From

  Background:
    Given a valid user is signed in to Web Apps

  @delete_all_shipping_addresses
  Scenario: regression
    Then click Orders Toolbar Add button
    Then on Manage Shipping Address modal, delete all addresses
    Then Sign out
