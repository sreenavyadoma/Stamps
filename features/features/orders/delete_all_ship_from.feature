
Feature:  Delete Ship From

  Background:
    Given I am signed in to Orders

  @delete_all_shipping_addresses
  Scenario: regression
    Then Toolbar: Add
    Then Ship-From: Delete all addresses
    Then Sign out
