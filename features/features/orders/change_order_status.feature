
Feature: Add Canceled Filter and Allow User to Manually Change Order Status

  Background:
    Given I am signed in to Orders

  @rob_dev1
  Scenario: Add Canceled Filter and Allow User to Manually Change Order Status
    And I Add a new order

    Then Filter Awaiting Shipment
    Then Move order to Shipped
    Then Filter Shipped
    Then Expect order moved to Shipped

    Then Move order to Canceled
    Then Expect order moved to Canceled

    Then Move order to Awaiting Shipment
    Then Expect order moved to Awaiting Shipment
