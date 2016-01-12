
Feature:  Delete Ship From

  Background:
    Given I am signed in to Orders

  @delete_all_shipping_addresses
  Scenario: regression
    When I Add a new order
    Then Delete all Ship-From address
    And Sign out
