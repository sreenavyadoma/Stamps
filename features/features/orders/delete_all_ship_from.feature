
Feature:  Delete Ship From

  Background:
    Given I am signed in to Orders

  @delete_all_shipping_addresses
  Scenario: regression
    When Add New Order
    Then Delete all Ship-From address
    And Sign out
