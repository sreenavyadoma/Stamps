
Feature:  Delete Ship From

  Background:
    Given I am signed in to Orders

  @delete_all_shipping_addresses
  Scenario: regression
    Then Add New Order
    Then Delete all Ship-From address
    Then Sign out
