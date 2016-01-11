
Feature: Order Status - Awaiting Shipment

  Background:
    Given I am signed in to Orders

  @order_status
  Scenario: Order Status - Awaiting Shipment
    When I Add a new order
    Then Expect Order Status to be "Awaiting Shipment"
    And Sign out