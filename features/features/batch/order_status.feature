
Feature: Order Status - Awaiting Shipment

  Background:
    Given I am signed in as a batch shipper

  @order_status @regression
  Scenario: Order Status - Awaiting Shipment
    And I Add a new order
    Then Expect Order Status to be Awaiting Shipment
    And Sign out
