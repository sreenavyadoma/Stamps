
Feature: Add Canceled Filter and Allow User to Manually Change Order Status

  Background:
    Given I am signed in to Orders

  @change_order_status
  Scenario: Add Canceled Filter and Allow User to Manually Change Order Status
    Then Filter Shipped
    Then Filter Cancelled
    Then Filter Awaiting Shipment

    When I Add a new order

    Then Move order to Shipped
    Then Filter Shipped
    Then Expect order moved to Shipped

    Then Move order to Canceled
    Then Filter Cancelled
    Then Expect order moved to Canceled

    Then Move order to Awaiting Shipment
    Then Filter Awaiting Shipment
    Then Expect order moved to Awaiting Shipment

    Then Sign out
