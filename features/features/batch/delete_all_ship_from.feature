
Feature:  Delete Ship From

  Background:
    Given I am signed in as a batch shipper

  @delete_all_shipping_addresses
  Scenario: regression
    And I Add a new order
    Then Delete all Ship-From address
    And Sign out
