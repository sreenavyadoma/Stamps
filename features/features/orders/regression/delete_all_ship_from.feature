
Feature:  Delete Ship From

  Background:
    Given a valid user is signed in to Web Apps

  @delete_all_shipping_addresses
  Scenario: regression
    Then add new order
    Then delete all addresses on manage shipping address modal
    Then sign out
