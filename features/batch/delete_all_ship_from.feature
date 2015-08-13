@regression
Feature:  Delete All Ship From

  Background:
    * I am signed in as a batch shipper

  @delete_all_shipping_addresses
  Scenario: regression
    * Add new order
    * Delete all Ship-From address
    * Sign out
