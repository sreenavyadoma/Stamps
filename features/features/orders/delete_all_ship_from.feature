
Feature:  Delete Ship From

  Background:
    Given a valid user is signed in to Web Apps

  @delete_all_shipping_addresses
  Scenario: regression
    Then in Orders Toolbar, click Add button
    Then Ship-From: Delete all addresses
    Then Sign out
