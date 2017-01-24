
Feature:  Delete Ship From

  Background:
    Given A user is signed in to Orders

  @delete_all_shipping_addresses
  Scenario: regression
    Then In Orders Toolbar, click Add button
    Then Ship-From: Delete all addresses
    Then Sign out
